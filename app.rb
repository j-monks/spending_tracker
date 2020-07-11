require("sinatra")
require("sinatra/contrib/all")
require_relative("models/transaction")
require_relative("models/merchant")
require_relative("models/category")
require_relative("controllers/merchant_controller")
also_reload("../models/*")

get "/" do
  @transactions = Transaction.all()  
  @transactions_total = Transaction.total()
  erb(:index)
end

