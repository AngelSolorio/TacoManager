class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment

  validates_presence_of :user_id, :establishment_id, :description
  validates_numericality_of :user_id, greater_than: 0
end
