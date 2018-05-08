class User < ApplicationRecord
  rolify
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

  def can_create?
    self.has_role?(:admin) || self.has_role?(:author)
  end

  def can_update?(post)
    self.has_role?(:admin) || (self.has_role?(:author) && post.user == self)
  end

  def can_delete?(post)
    self.has_role?(:admin) || self.has_role?(:moderator) || (self.has_role?(:author) && post.user == self)
  end

  def user_list?(post)
    self.has_role?(:admin)
  end

end
