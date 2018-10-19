# require "bundler/setup"
# require "infrataster/plugin/ftp"
# 
# RSpec.configure do |config|
#   # Enable flags like --only-failures and --next-failure
#   config.example_status_persistence_file_path = ".rspec_status"
# 
#   # Disable RSpec exposing methods globally on `Module` and `main`
#   config.disable_monkey_patching!
# 
#   config.expect_with :rspec do |c|
#     c.syntax = :expect
#   end
# end

require 'infrataster/rspec'
require 'infrataster-plugin-ftp'

Infrataster::Server.define(
  :ftp_server,
  '192.168.0.6',
  ftp: { user: 'ftpuser', pass: 'supersecret', passive: true },
)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
