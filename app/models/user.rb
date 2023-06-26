class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  has_many :pelabuhans
  has_many :notices, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  enum role: [:admin, :moderator, :user]
  after_initialize :set_default_role, if: :new_record?
  has_one_attached :image
  validate :image_file_format

  private

  def set_default_role
    self.role = :user
  end

  def image_file_format
    return unless image.attached?
    unless image.content_type.in?(%w(image/jpeg image/png image/gif))
      image.purge
      errors.add(:image, 'must be a JPEG, PNG, or GIF image')
    end
  end
  
end
