Mailer38
===
Mailer38 is a Ruby app designed to send personalised mass mailings to lists of individuals, tracking opens and clicks.
- Built with Padrino on Sinatra, on ActiveRecord
- Authenticates against domains using Google OAuth
- Relies on AWS SES to send emails
- Renders Handlebars templates as emails
- Uses Nokogiri gem for HTML parsing and manipulation

Installation
===
- Clone the repo
- Bundle install
- Set environment variables for DOMAIN and OAUTH_DOMAIN (these should be the accessible web route of the app, and your Google Apps domain)
- Set environment variables for SES: AWS_REGION, AWS_SECRET_ACCESS_KEY, AWS_ACCESS_KEY_ID
- Run it!

What's complete?
===
- [x]  Sending emails through SES to lists
- [x]  Tracking clicks by replacing links with routes through the Mailer
- [ ]  Tracking opens by inserting a blank pixel
- [ ]  A nice WYSIWYG for editing
- [ ] Mailing templates