require_relative("../models/merchant")
require("pry-byebug")

merchant1 = Merchant.new({
    "name" => "Tesco"
})
merchant1.save()


binding.pry
nil