require_relative("../models/merchant")
require_relative("../models/category")
require_relative("../models/transaction")
require_relative("../models/user")
require("pry-byebug")

Transaction.delete_all()
Merchant.delete_all()
Category.delete_all()

# MERCHANTS
merchant1 = Merchant.new({
    "name" => "Tesco",
    "isdeleted" => 0,
    "isdeactivated" => 1
})
merchant1.save()

merchant2 = Merchant.new({
    "name" => "Amazon",
    "isdeleted" => 0
})
merchant2.save()

merchant3 = Merchant.new({
    "name" => "Tele-Taxi",
    "isdeleted" => 0
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


user1 = User.new({
    "budget" => 0.00
})
user1.save()

user1.budget = 2.43
user1.update()
# transaction1.amount = 2.43
# transaction1.update()


# p sprintf("%.2f", @user1.budget)

# VARIABLES
# all_transactions = Transaction.all()

# soft_delete_cat1 = category1.isdeleted = 1
# category1.update()

# soft_delete_cmerch1 = merchant1.isdeleted = 1
# merchant1.update()
# all_categories = Category.all()

# de = Merchant.is_deactivated?(merchant1.id)
# merchant1.isdeactivated = 1
# merchant1.update()
# Merchant.deactivate(merchant1.id)

# merchant1.name = "School"
# merchant1.update()

binding.pry
nil