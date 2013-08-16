class Dish < ActiveRecord::Base
  has_many :includes
  has_many :orders, through: :includes
  has_many :menus
  has_many :establishments, through: :menus

  validates_presence_of :name, :price
  validates_numericality_of :price, greater_than: 0
end
