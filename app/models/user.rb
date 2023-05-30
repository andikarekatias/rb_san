class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin, :moderator, :user]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role = :user
  end
  has_many :pelabuhans
  has_many :notices
end
