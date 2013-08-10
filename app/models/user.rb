class User < ActiveRecord::Base #OmniAuth::Identity::Models::ActiveRecord
  #has_secure_password validations: true

  validates :uid, :provider, :name, presence: true
  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, unless: 'email.nil?'

  #validates :password, length: { minimum: 4, maximun: 8 }, if: -> r { r.password.present? }
  #validates :password_confirmation, presence: true, if: -> r { r.password.present? }

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid']) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      Rails.logger.debug "****************** AUTH => #{user.inspect}"
    end
  end
end
