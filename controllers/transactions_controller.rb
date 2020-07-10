require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/transaction.rb")
also_reload("../models/*")

