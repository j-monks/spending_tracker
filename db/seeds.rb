require_relative("../models/merchant")
require_relative("../models/category")
require_relative("../models/transaction")
require("pry-byebug")

merchant1 = Merchant.new({
    "name" => "Tesco"
})
merchant1.save()

merchant2 = Merchant.new({
    "name" => "Amazon"
})
merchant2.save()

category1 = Category.new({
    "name" => "Groceries"
})
category1.save()

transaction1 = Transaction.new({
    "merchant_id" => merchant1.id,
    "category_id" => category1.id,
    "amount" => 12.35
})
transaction1.save()

merchant1.name = "Asda"
merchant1.update()

category1.name = "Transportation"
category1.update()

transaction1.merchant_id = merchant2.id
transaction1.update()

binding.pry
nil