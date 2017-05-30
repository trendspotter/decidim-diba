ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'decidim/faker/localized'
require 'webmock/minitest'
require 'minitest/mock'

module ActiveSupport
  class TestCase

    include FactoryGirl::Syntax::Methods

  end
end
