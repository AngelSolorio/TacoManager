Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email', image_size: 'normal'
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], image_size: 'bigger'
  provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], scope: 'userinfo.email, userinfo.profile'
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  provider :identity, :fields => [:name, :email], on_failed_registration: lambda { |env|
    UsersController.action(:new).call(env)
  }
end
