require_relative 'contact'
require 'sinatra'


get "/" do

  erb :index

end

get "/index" do

  erb :index
end

get "/contacts" do

  @all_contacts = Contact.all
  @contact_count = Contact.count
  
  erb :contacts
end

get "/contacts/:id" do

  @contact = Contact.find(params[:id].to_i)

erb :show_contact
end

get "/about" do

  erb :about
end


after do
  ActiveRecord::Base.connection.close
end
