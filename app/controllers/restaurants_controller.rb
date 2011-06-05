class RestaurantsController < ApplicationController
  before_filter :remove_side_bar
  before_filter :set_pagetitle

  def set_pagetitle
    @pagetitle = "Restaurant Admin"    
  end
  
  def remove_side_bar
    @side_bar = true    
  end
  
  active_scaffold :restaurant do |conf|
  end
end 