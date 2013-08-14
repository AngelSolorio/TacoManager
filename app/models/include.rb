class Include < ActiveRecord::Base
  belongs_to :order
  belongs_to :dish

  validates_presence_of :order_id, :dish_id, :quantity
  validates_uniqueness_of :order_id, scope: :dish_id
  validates_numericality_of :quantity, greater_than: 0
end
