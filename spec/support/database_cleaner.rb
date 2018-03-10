require 'database_cleaner'

RSpec.configure do |config|
  config.around(:each) do |example|
    DatabaseCleaner[:active_record].strategy = :truncation

    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:each) do |example|
    Rubyhome::AccessoryInfo.instance.remove_paired_clients!
  end
end
