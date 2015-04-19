RSpec.configure do |config|
  require "pry-byebug"
  require "webmock/rspec"

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  base_dir = File.expand_path("../../", __FILE__)
  Dir["#{base_dir}/lib/**/*.rb"].each { |f| require f }
  Dir["#{base_dir}/spec/support/**/*.rb"].each { |f| require f }

  WebMock.disable_net_connect!(
    allow_localhost: false,
    net_http_connect_on_start: true
  )
end
