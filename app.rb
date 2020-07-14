require("sinatra")
require("sinatra/contrib/all")
require_relative("models/transaction")
require_relative("models/merchant")
require_relative("models/category")
require_relative("controllers/merchant_controller")
require_relative("controllers/category_controller")
require_relative("controllers/transaction_controller")
also_reload("../models/*")

get "/" do
  @attributes = ["Amount", "Date", "Merchant", "Category"]
  @transactions = Transaction.all()
  @transactions_total = Transaction.total()
  erb(:index)
end

post "/" do
    Transaction.new(params).save()
    redirect to "/"
end

