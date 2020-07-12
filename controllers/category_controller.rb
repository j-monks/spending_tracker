require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/category")
also_reload("../models/*")

get "/categories" do 
  @categories = Category.all()  
  erb(:"categories/index")
end

get "/new-category" do
    erb(:"categories/new")
end

post "/categories" do
    Category.new(params).save()
    redirect to "/categories"
end

post "/categories/:id" do
    category = Category.find(params[:id])
    category.name = params[:name]
    category.update()
    redirect to "/categories"
end

post "/categories/:id/delete" do 
    Category.soft_delete(params[:id])
    redirect to "/categories"
end

post "/categories/:id/edit" do 
    @category = Category.find(params[:id])
    erb(:"categories/edit")
end

