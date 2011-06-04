class ViewController < ApplicationController
  
  def index 
    del = params[:deliver] || [true, false]
    walk = params[:walk] || [true, false]
    cat = params[:cat_id] || Category.all.collect(&:id)
    if params[:cat_id]
        @results = Restaurant.limit(params[:limit] || 50 ).random.find_all_by_deliver_and_walk_and_category_id(del, walk,  cat)
    else 
        @results = Restaurant.limit(params[:limit] || 50 ).random.find_all_by_deliver_and_walk(del, walk)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def home 
    @list = Category.all.map{|s| {"id" => s.id, "name" => s.name} }
    respond_to do |format|
      format.html
      format.js
    end
  end
# def scrape 
 # end 
  def from_menu_pages_url
    url = (params[:url] == "") ? "http://losangeles.menupages.com/restaurants/spumoni/" : params[:url]
   # url = params[:url] || "http://losangeles.menupages.com/restaurants/spumoni/"
    new_restaurant = Restaurant.new
    new_restaurant.from_menu_pages_url(url)
    respond_to do |format|
      if (params[:url]!="") && new_restaurant.save
        format.html{ redirect_to(new_restaurant, :notice => 'Restaurant was successfully created.') }
        format.js
      else
        format.html{ redirect_to(root_path, :notice => 'You can not enter a blank url') }
        format.js
      end 
    end
end
end

