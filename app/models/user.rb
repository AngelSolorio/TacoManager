class User < ActiveRecord::Base
  has_many :establishments
  has_many :comments
  has_many :establishments, through: :comments
  has_and_belongs_to_many :establishments
  has_many :orders
  has_many :establishments, through: :orders
  has_many :requisitions
  has_many :requisitions, through: :orders

  validates :provider, :name, presence: true
  validates_uniqueness_of :email, unless: 'email.nil?'
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, unless: 'email.nil?'

  has_attached_file :picture, default_url: 'generic_person.jpg', styles: { medium: '360x>', thumb: '170x>' }
  validates_attachment :picture, size: { less_than_or_equal_to: 1.megabytes }, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png'] }

  scope :my_user, -> (user) { where(id: user.id) }

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid']) ||
    (find_by_email(auth['info']['email']) if !auth['info']['email'].nil?) ||
    create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
    end
  end
end