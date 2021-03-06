#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index
	# erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about_us' do 
	erb :about_us
end

get '/appointment' do 
	erb :appointment
end

post '/appointment' do 
	@user_name = params['user_name']
  @user_phone = params['user_phone']
  @date_time = params['date_time']
	@select_teacher = params['select_teacher']

	file_users_data = File.open("./public/users_date.txt", "a") do |f|
		f.write("Persona_barbershop: #{@user_name}, Phone: #{@user_phone}, Data_visit: #{@date_time}, Select teacher: #{@select_teacher}\n")
		f.close
	end

	erb :appointment
end

post '/contacts' do 
	@email_address = params['email_address']
	@text_email_address = params['text_email_address']

	file_email_data = File.open("./public/email_data.txt", "a") do |f|
		f.write("Email address: #{@email_address}, Text message: #{@text_email_address}\n")
		f.close
	end

	erb :contacts
end

get '/contacts' do 
	erb :contacts
end

get '/admin' do 
	# @logfile = File.read("public/email_data.txt")
	erb :admin
end

get '/authorization' do 
	erb :authorization
end 

post '/authorization' do
	@niсkname = params[:niсkname]
	@user_password = params[:user_password]

	if @niсkname == "admin" && @user_password == "rokit"
		@logfile = File.read("public/email_data.txt")
		# redirect to ('/admin')
		erb :admin
	else
		erb "Sorry, bad password. Try again."
	end
end