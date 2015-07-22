ENV['RAILSENV'] ||= 'test' require 'spechelper' require File.expandpath('../../config/environment', _FILE_) require 'rspec/rails' require 'factorygirl' require 'devise'

    ActiveRecord::Migration.maintain_test_schema!

    RSpec.configure do |config|
      config.fixture_path = "#{::Rails.root}/spec/fixtures"

      config.use_transactional_fixtures = true

      config.expect_with :rspec do |c|
        c.syntax = [:should, :expect]
      end

      config.infer_spec_type_from_file_location!
    end