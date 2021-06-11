class SearchController < ApplicationController

  def search
    @value = params["search"]["value"]
    @model = params["search"]["model"]
    @how = params["search"]["how"]
    @datas = search_for(@value, @model, @how)
  end

  private

  def search_for(value, model, how)
    case how
    when 'match'
      match(model, value)
    when 'forward'
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end
  end

 def match(model, value)
   if model == 'User'
     User.where(name: value)
   elsif model == 'PostImage'
     PostImage.where(shop_name: value)
   end
 end

 def forward(model, value)
   if model == 'User'
     User.where("name Like?", "#{value}%")
   elsif model == 'PostImage'
     PostImage.where("shop_name Like?", "#{value}%")
   end
 end

 def backward(model, value)
   if model == 'User'
     User.where("name Like?", "%#{value}")
   elsif model == 'PostImage'
      PostImage.where("shop_name Like?", "%#{value}")
   end
 end

 def partical(model, value)
   if model == 'User'
     User.where("name Like?", "%#{value}%")
   elsif model == 'PostImage'
     PostImage.where("shop_name Like?", "%#{value}%")
   end
 end
end
