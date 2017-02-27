class User < ApplicationRecord
  has_many :articles
  acts_as_authentic

  def deliver_mail_activate_instructions!
    NotifierMailer.mail_activate_instructions(self).deliver_now
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    NotifierMailer.password_reset_instructions(self).deliver_now
  end

  def activate!
    self.active = true
    save
  end
end
