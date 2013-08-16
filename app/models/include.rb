class Include < ActiveRecord::Base
  belongs_to :order
  belongs_to :dish

  validates_presence_of :order_id, :dish_id, :quantity
  validates_uniqueness_of :order_id, scope: :dish_id
  validates_numericality_of :quantity, greater_than: 0

  before_save :update_cost

  private
  def update_cost
    total = Order.find_by_id(self.order_id)[:cost]
    price = Dish.find_by_id(self.dish_id)[:price]
    total += price * self.quantity
    order.update_attribute(:cost, total)
  end
end
