class Establishment < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_and_belongs_to_many :users
  has_many :orders
  has_many :users, through: :orders
  has_many :requisitions, through: :orders
  has_many :images

  validates_presence_of :address, :phone, :schedule, :user_id
end
