class Identity < OmniAuth::Identity::Models::ActiveRecord
  has_secure_password validations: true
end