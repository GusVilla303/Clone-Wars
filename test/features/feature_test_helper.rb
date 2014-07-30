require_relative '../test_helper'
require 'capybara'
require 'sinatra'
require_relative '../../lib/app'

Capyabara.app = BackCountry
  class FeatureTest < Minitest::Test
    include Capybara::DSL

    def teardown
      Capybara.reset_session!
      Capybara.use_default_driver
    end
  end

  class Capybara::Session
    def has_submit_button
      self.has_selector?("input[type=submit][value='#{value}']")
    end
  end
