module MailerPrototype
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    require 'csv'

    enable :sessions

    use OmniAuth::Builder do
      provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
    end

    before do
      unless session[:authenticated] or request.path == '/auth/google_oauth2/callback' or Padrino.env == :development
        redirect '/auth/google_oauth2'
      end
    end

    get '/auth/google_oauth2/callback' do
      if request.env["omniauth.auth"][:info][:email].end_with?(ENV['OAUTH_DOMAIN'])
        session[:authenticated] = true
        redirect '/templates'
      else
        redirect '/auth/google_oauth2'
      end
    end

    get '/' do
     redirect '/mailings'
    end

  end
end
