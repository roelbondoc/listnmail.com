class Emailer < ActionMailer::Base
  def distribution(recipient,email)
    recipients recipient.email
    from       "#{email.list.name}@listnmail.com"
    subject    email.subject
    body       email.body
  end
end
