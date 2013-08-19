class Requisition < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  has_many :establishments, through: :orders
  has_many :users, through: :orders

  validates_presence_of :cost, :status, :checktime, :user_id
  validates_numericality_of :cost, greater_than: 0
  #validates :checktime, future_date: true
end
