class Establishment < ActiveRecord::Base
  validates_presence_of :address, :phone, :schedule
end
