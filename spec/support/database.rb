# from http://jordanhollinger.com/2012/12/21/the-perfect-rspec-config
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  # Use transactions by default
  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  # since js tests run via capybara+phantomjs which runs in a separate thread,
  # it doesn't have access to the rspec-thread-local database transactions, and so
  # we need a different strategy for cleaning the database there
  # Switch to truncation for javascript tests, but *only clean used tables*
  config.before :each, js: true do
    DatabaseCleaner.strategy = :truncation, {pre_count: true}
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end