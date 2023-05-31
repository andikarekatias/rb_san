class Notice < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_noticed_notification model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
end
