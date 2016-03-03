MailerPrototype::App.controllers :opens do

	get '/:mailing_id/:guid' do
		member = Member.where(guid: params[:guid]).first
		member_mailing = MemberMailing.where(mailing_id: params[:mailing_id], member_id: member.id).first
		if member_mailing
			Open.create!({member_mailing_id: member_mailing.id})
			send_file '/images/pixel.png', type: 'image/png', disposition: 'inline'
		else
			400
		end
	end
end
