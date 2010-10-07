class Email < ActiveRecord::Base
  belongs_to :list

  def before_create
    self.sender_email = self.sender_email.downcase
  end

  def after_create
    self.list.recipients.find_or_create_by_email(self.sender_email)
    self.distribute
  end

  def distribute
    self.list.recipients.each do|recipient|
      Emailer.deliver_distribution(recipient,self) if recipient.email != self.sender_email && !recipient.suppressed?
    end
  end

  def self.create_from_email(email)
    list = nil
    email.to.each do |address|
      name = address.to_s.gsub(/@.*$/,'')
      list = List.find_by_name(name) if list.nil?
    end
    unless list.nil?
      return list.emails.create(:sender_email => email.from, :subject => email.subject, :body => email.body)
    end
    return nil
  end
end
