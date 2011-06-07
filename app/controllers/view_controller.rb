class ViewController < ApplicationController

  def index 
    @pagetitle = "All"
    if params[:deliver]
      del = true
    else
      del = [true, false]
    end
    if params[:walk]
      walk = true
    else
      walk = [true, false]
    end
    cat = params[:cat_id]
    @pagination = params[:paginate]
    if params[:cat_id]
      @results = Restaurant.limit(params[:limit] || 50 ).random.find_all_by_deliver_and_walk_and_category_id(del, walk, cat)
    else 
      @results = Restaurant.limit(params[:limit] || 50 ).random.find_all_by_deliver_and_walk(del, walk)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def home 
    @pagetitle = "Home"
    respond_to do |format|
      format.html
      format.js
    end
  end
  def scrape
    @pagetitle = "Menu Pages Screen Scaper"
  end
  def from_menu_pages_url
    @pagetitle = "Menu Pages Screen Scaper"
    if params[:url].to_s.downcase.match("http://losangeles.menupages.com/restaurants/")
      url = params[:url]
      new_restaurant = Restaurant.new
      new_restaurant.from_menu_pages_url(url)
    end
    respond_to do |format|
      if url && new_restaurant.save
        format.html{ redirect_to(new_restaurant, :notice => 'Restaurant was successfully created.') }
      else
        format.html{ redirect_to(scrape_path, :notice => 'Please enter a valid menupages url begining with http://losangeles.menupages.com/restaurants/ ') }
      end 
    end
  end

end

