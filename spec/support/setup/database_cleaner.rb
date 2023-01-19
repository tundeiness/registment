require 'database_cleaner'

RSpec.configure do |config|
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.around do |example|
  #   DatabaseCleaner.cleaning do
  #     example.run
  #   end
  # end

  config.use_transactional_fixtures = false

  DatabaseCleaner.strategy = :truncation
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
       example.run
    end
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end
