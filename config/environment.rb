RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
end

GMAIL_HOST     = "imap.gmail.com"
GMAIL_PORT     = 993
GMAIL_USERNAME = "service@listnmail.com"
GMAIL_PASSWORD = "xxxx"
