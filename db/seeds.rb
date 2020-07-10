require_relative("../models/merchant")
require_relative("../models/category")
require("pry-byebug")

merchant1 = Merchant.new({
    "name" => "Tesco"
})
merchant1.save()

category1 = Category.new({
    "name" => "Groceries"
})
category1.save()

merchant1.name = "Asda"
merchant1.update()


binding.pry
nil