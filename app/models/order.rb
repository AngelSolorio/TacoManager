class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  belongs_to :requisition
  has_many :includes
  has_many :dishes, through: :includes

  validates_presence_of :user_id, :establishment_id, :requisition_id, :cost
  validates_uniqueness_of :user_id, scope: [:establishment_id, :requisition_id]

  scope :details, -> { joins(:requisitions) }

  before_save :update_cost

  private
  def update_cost
    total = Requisition.find_by_id(self.requisition_id)[:cost]
    total += self.cost
    requisition.update_attribute(:cost, total)
  end
end
