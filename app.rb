require("sinatra")
require("sinatra/contrib/all")
require_relative("models/transaction")
require_relative("models/merchant")
require_relative("models/category")
also_reload("../models/*")

get "/" do
  @transactions = Transaction.all()  
  erb(:index)
end

