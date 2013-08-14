class Menu < ActiveRecord::Base
  belongs_to :dish
  belongs_to :establishment

  validates_presence_of :dish_id, :establishment_id
  validates :dish_id, uniqueness: { scope: :establishment_id }
end
