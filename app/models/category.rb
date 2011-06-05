class Category < ActiveRecord::Base
  has_many :restaurants
  validates_presence_of :name
end
