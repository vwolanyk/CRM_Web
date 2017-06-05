require_relative 'contact'
require 'sinatra'
require 'sinatra/reloader'

# HOME PAGE

get "/" do

  redirect to('/index')

end

# INDEX AKA HOME

get "/index" do

  erb :index
end

# ALL CONTACTS LIST

get "/contacts" do

  @all_contacts = Contact.all
  @contact_count = Contact.count

  erb :contacts
end

# SINGLE CONTACT FULL LISTING

get "/contacts/:id" do

  @contact = Contact.find(params[:id].to_i)

  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound

  end

end

# ADD NEW contact

get "/add_contact" do

  erb :add_contact
end

post '/add_contact' do

Contact.create(
first_name: params[:first_name],
last_name:  params[:last_name],
email:      params[:email],
note:       params[:note],
)

redirect to('/contacts')


end


# ABOUT ME
get "/about" do

  erb :about
end

# Closes Connections beacause minirecord won't

after do
  ActiveRecord::Base.connection.close
end
