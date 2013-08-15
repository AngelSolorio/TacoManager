class Image < ActiveRecord::Base
  belongs_to :establishment

  validates_presence_of :establishment_id

  accepts_nested_attributes_for :establishment

  has_attached_file :image, styles: { medium: '360x>', thumb: '190x>' }

  validates_attachment :image, size: { less_than_or_equal_to: 1.megabytes }, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png'] }
end
