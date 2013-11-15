require 'database_cleaner'
require 'playhouse/theatre'
require 'cobudget_core'

root_dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))
theatre = Playhouse::Theatre.new(root: root_dir, environment: 'test')
theatre.start_staging

#DatabaseCleaner.strategy = :truncation
#DatabaseCleaner.clean_with(:truncation)

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

def api
  @api ||= Cobudget::API.new
end