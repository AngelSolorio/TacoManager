class Requisition < ActiveRecord::Base
  validates_presence_of :cost,  :status, :checktime
  validates_numericality_of :cost, greater_than: 0
end
