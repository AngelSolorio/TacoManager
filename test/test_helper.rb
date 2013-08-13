ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/rails'
require 'minitest/focus'
require 'minitest/colorize'
require 'minitest/rails/capybara'

Rails.backtrace_cleaner.remove_silencers!

# Expetactions
module Minitest::Expectations
  infect_an_assertion :assert_redirected_to, :must_redirect_to
  infect_an_assertion :assert_template, :must_render_template
  infect_an_assertion :assert_response, :must_response_with
end

class ActiveSupport::TestCase
  include Warden::Test::Helpers

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  class << self
    alias_method :context, :describe
  end

  def self.prepare
    # Add anything that you need before suite starts
  end

  prepare

  def setup
    Warden.test_reset!
    setup_warden
  end

  def request
    @request ||= ActionController::TestRequest.new
  end

  def setup_warden
    @warden ||= begin
      manager = Warden::Manager.new(nil,
        &Rails.application.config.middleware.detect{|m| m.name == 'Warden::Manager'}.block)
        request.env['warden'] = Warden::Proxy.new(@request.env, manager)
     end
  end
  alias_method :warden, :setup_warden

  def log_in_user(id = 100)
    user = User.find id
    warden.set_user user, scope: :user
  end

  def stub_method_instance(klass, method, &block)
    klass.class_eval do
      def self.metaclass
        class << self; self; end
      end
    end

    klass.metaclass.send(:define_method, method, ->(*args) { block.call(args) })
  end

  def stub_method(klass, method, &block)
    klass.send(:define_method, method, ->(*args) { block.call(args) })
  end
end

class Capybara::Rails::TestCase

  def self.prepare
    # Add anything that you need before suite starts
  end

  prepare

  def setup
    User.destroy_all
    Establishment.destroy_all

    Warden.test_reset!
    Capybara.reset_sessions!
  end

  def teardown
  end

  def mock_omniauth(uid = '12345', email = 'user@test.com')
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      { 'provider' => 'github', 'uid' => uid,
        'info' => { 'name' => 'Test user', 'email' => email }
      }
    )
  end
end