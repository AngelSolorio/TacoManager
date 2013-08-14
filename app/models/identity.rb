class Identity < OmniAuth::Identity::Models::ActiveRecord
  has_secure_password validations: true

  validates_presence_of :name, :email, :password_digest
end