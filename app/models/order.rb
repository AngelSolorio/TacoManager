class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment
  belongs_to :requisition

  validates_presence_of :user_id, :establishment_id, :requisition_id, :cost
  validates_uniqueness_of :user_id, scope: [:establishment_id, :requisition_id]
end
