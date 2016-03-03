MailerPrototype::App.controllers :clicks do

	get '/:mailing_id/:link_id/:guid' do
		member = Member.where(guid: params[:guid]).first
		member_mailing = MemberMailing.where(mailing_id: params[:mailing_id], member_id: member.id).first
		link = Link.find(params[:link_id])
		if member_mailing and link
			Click.create!({member_mailing_id: member_mailing.id, link_id: params[:link_id]})
			redirect link.url
		else
			400
		end
	end
end
