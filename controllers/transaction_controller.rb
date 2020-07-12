require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction")
also_reload("../models/*")

get "/new-transaction" do 
    @merchants = Merchant.all()
    @categories = Category.all()
    erb(:"transactions/new")
end

post "/:id" do 
    transaction = Transaction.find(params[:id])
    transaction.merchant_id = params[:merchant_id]
    transaction.category_id = params[:category_id]
    transaction.amount = params[:amount]
    transaction.update()
    redirect to "/"
end

post "/:id/delete" do
    Transaction.delete(params[:id])
    redirect to "/"
end

post "/:id/edit" do
    transaction = Transaction.find(params[:id])
    erb(:"/transactions/edit")
end

  