require 'net/imap'
require 'net/http'

class List < ActiveRecord::Base
  has_many :emails
  has_many :recipients

  validates_uniqueness_of :name
  validates_presence_of :admin_email
  validates_presence_of :name

  def before_create
    self.admin_email = self.admin_email.downcase
    self.key = Digest::MD5.hexdigest(Time.now.to_i.to_s+self.admin_email)
  end

  def after_create
    self.recipients.create(:email => self.admin_email)
  end

  def self.check_email
    imap = Net::IMAP.new(GMAIL_HOST, GMAIL_PORT, true)
    imap.login(GMAIL_USERNAME,GMAIL_PASSWORD)
    imap.select('INBOX')
    imap.search(["NOT","DELETED"]).each do|uid|
      source = imap.fetch(uid, "RFC822")[0].attr["RFC822"]
      email = TMail::Mail.parse(source)
      if Email.create_from_email(email)
        imap.store(uid, "+FLAGS", [:Deleted])
      end
    end
    imap.logout
    imap.disconnect
  end

  NAMES = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "Xray", "Yankee", "Zulu"]
end
