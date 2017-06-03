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

# ABOUT ME
get "/about" do

  erb :about
end

# Closes Connections beacause minirecord won't

after do
  ActiveRecord::Base.connection.close
end
