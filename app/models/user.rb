class User < ApplicationRecord
  after_create :send_notification
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :services
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def send_notification
    UserNotifierMailer.send_notification(self).deliver_now
  end
end
