class Recipient < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :email
  validate :valid_email?

  def before_create
    self.email = self.email.downcase
    self.key = Digest::MD5.hexdigest(Time.now.to_i.to_s+self.email)
  end

  def suppressed?
    return Suppression.exists?(:email => self.email)
  end

  def valid_email?
    TMail::Address.parse(self.email)
    rescue
     errors.add_to_base("Must be a valid email")
  end
end
