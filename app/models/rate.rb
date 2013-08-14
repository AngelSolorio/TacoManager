class Rate < ActiveRecord::Base
  belongs_to :user
  belongs_to :establishment

  validates_presence_of :user_id, :establishment_id, :rate_value
  validates_numericality_of :rate_value, greater_than_or_equal_to: 0, less_than_or_equal_to: 5
end
