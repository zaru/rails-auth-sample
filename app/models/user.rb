class User < ApplicationRecord
  acts_as_authentic

  def deliver_password_reset_instructions!
    reset_perishable_token!
    NotifierMailer.password_reset_instructions(self).deliver_now
  end
end
