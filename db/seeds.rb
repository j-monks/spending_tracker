require_relative("../models/merchant")
require_relative("../models/category")
require_relative("../models/transaction")
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Category.delete_all()

# MERCHANTS
merchant1 = Merchant.new({
    "name" => "Tesco"
})
merchant1.save()

merchant2 = Merchant.new({
    "name" => "Amazon"
})
merchant2.save()

merchant3 = Merchant.new({
    "name" => "Tele-Taxi"
})
merchant3.save()

# CATEGORIES
category1 = Category.new({
    "name" => "Groceries"
})
category1.save()

category2 = Category.new({
    "name" => "Transport"
})
category2.save()

category3 = Category.new({
    "name" => "Clothing"
})
category3.save()

# TRANSACTIONS
transaction1 = Transaction.new({
    "merchant_id" => merchant1.id,
    "category_id" => category1.id,
    "amount" => 12.35
})
transaction1.save()

transaction2 = Transaction.new({
    "merchant_id" => merchant3.id,
    "category_id" => category2.id,
    "amount" => 25.00
})
transaction2.save()

transaction3 = Transaction.new({
    "merchant_id" => merchant2.id,
    "category_id" => category3.id,
    "amount" => 5.43
})
transaction3.save()

# VARIABLES
all_transactions = Transaction.all()
all_merchants = Merchant.all()
all_categories = Category.all()

binding.pry
nil