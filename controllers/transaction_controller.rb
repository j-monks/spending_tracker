require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/transaction")
also_reload("../models/*")


get "/new-transaction" do 
    @merchants = Merchant.all()
    @categories = Category.all()
    erb(:"transactions/new")
end

get "/sort" do
    @attributes = ["Date", "Amount", "Merchant", "Category"]
    @previous_param = params[:sort]
    if params[:sort] == "Date"
    @transactions = Transaction.all_order_by_created_at()
    elsif params[:sort] == "Amount"
    @transactions = Transaction.all_order_by_amount()
    elsif params[:sort] == "Merchant"
    @transactions = Transaction.all_order_by_merchant()
    elsif params[:sort] == "Category"
    @transactions = Transaction.all_order_by_category()
    end 
    @transactions_total = Transaction.total()
    erb(:index)
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
    @merchants = Merchant.all()
    @categories = Category.all()
    @transaction = Transaction.find(params[:id])
    @previous_merchant = Merchant.find(@transaction.merchant_id)
    @previous_category = Category.find(@transaction.category_id)
    erb(:"/transactions/edit")
end

post "/sort" do
    
end

  