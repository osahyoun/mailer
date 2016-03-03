class MemberMailing < ActiveRecord::Base
  self.table_name = 'mailer.member_mailings'

  belongs_to :mailing
  belongs_to :member

  def send_email
    html_body = self.mailing.render(self.member_id)
    ses = AWS::SES::Base.new(
    	:access_key_id => ENV['AWS_ACCESS_KEY_ID'], 
    	:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], 
    	:server => ENV['AWS_REGION']
    )
    ses.send_email(
    	:to => self.member.email, 
    	:source =>  ENV['FROM_EMAIL'], 
    	:subject => self.mailing.subject, 
    	:html_body => html_body
    )
  end
  after_create :send_email
end
