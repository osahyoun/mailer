MailerPrototype::App.controllers :mailings do

	get '/' do
      @mailings = Mailing.includes(:list).limit(30).reverse
      erb :'mailings/list'
	end

	get '/new' do
		@mailing = Mailing.new
		@lists = List.order('name ASC').all
		erb :'mailings/build'
	end

	post '/new' do
		@mailing = Mailing.create!(params[:mailing])
		@mailing.begin_send
		redirect '/mailings'
	end

	get '/:id/edit' do
		@mailing = Mailing.find params[:id]
		erb :'mailings/build'
	end

	post '/:id/edit' do 
	end
end
