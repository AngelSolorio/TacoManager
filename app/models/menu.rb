class Menu < ActiveRecord::Base
  belongs_to :dish
  belongs_to :establishment

  validates_presence_of :dish_id, :establishment_id
  validates_uniqueness_of :dish_id, :establishment_id
end
