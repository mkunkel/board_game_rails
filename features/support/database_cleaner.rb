begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
