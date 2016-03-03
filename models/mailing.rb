class Mailing < ActiveRecord::Base
    self.table_name = 'mailer.mailings'

    belongs_to :mailing_template
    belongs_to :list

    def render(member_id)
        # render template for member
        handlebars = Handlebars::Context.new
        member = Member.find(member_id)
        template = handlebars.compile(self.parsed_html)
        html = template.call(:member => member)
        open_image_url = "<img src=\"#{ENV['DOMAIN']}/opens/#{self.id}/#{member.guid}\" />"
        return "#{html}#{open_image_url}"
    end

    def begin_send
        # rewrite body
        doc = Nokogiri::HTML::DocumentFragment.parse(self.body_html)

        # rewrite links
        doc.css("a").each{|raw_link|
            raw_url = raw_link.attributes["href"].value
            link = Link.create!({mailing_id: self.id, url: raw_url})
            raw_link.attributes["href"].value = "#{ENV['DOMAIN']}/clicks/#{self.id}/#{link.id}/{{member.guid}}"
        }
        self.update_attribute(:parsed_html, doc.to_html.gsub!())

        ListMember.where(:list_id => self.list_id).find_in_batches(batch_size: 10000) do |batch|
            puts batch.inspect
            self.send_to_batch(batch)
        end
    end
    handle_asynchronously :begin_send

    def send_to_batch(list_members)
        # create member mailings
        list_members.each{|list_member|
            member_mailing = MemberMailing.create!({member_id: list_member.member_id, mailing_id: self.id})
        }
    end
    handle_asynchronously :send_to_batch
end
