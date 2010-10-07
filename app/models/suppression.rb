class Suppression < ActiveRecord::Base
  def before_create
    self.email = self.email.downcase
    self.key = Digest::MD5.hexdigest(Time.now.to_i.to_s+self.email)
  end
end
