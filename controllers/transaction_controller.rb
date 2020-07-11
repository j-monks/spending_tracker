require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction")
also_reload("../models/*")

get "/new-transaction" do 
    @merchants = Merchant.all()
    @categories = Category.all()
    erb(:"transactions/new")
end


  