class Requisition < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders
  has_many :establishments, through: :orders
  belongs_to :user

  validates_presence_of :cost, :status, :checktime, :user_id
  validates_numericality_of :cost, greater_than: 0
end
