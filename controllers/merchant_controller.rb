require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant")
also_reload("../models/*")

get "/merchants" do 
  @merchants = Merchant.all()  
  erb(:"merchants/index")
end

get "/new-merchant" do
    erb(:"merchants/new")
end

post "/merchants" do
    Merchant.new(params).save()
    redirect to "/merchants"
end
