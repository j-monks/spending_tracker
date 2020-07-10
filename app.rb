require("sinatra")
require("sinatra/contrib/all")
require_relative("models/transaction")
also_reload("../models/*")

get "/" do
  @transactions = Transaction.all()  
  erb(:index)
end

