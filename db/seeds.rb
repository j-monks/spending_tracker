require_relative("../models/merchant")
require("pry-byebug")

merchant1 = Merchant.new({
    "name" => "Tesco"
})
merchant1.save()

merchant1.name = "Asda"
merchant1.update()

binding.pry
nil