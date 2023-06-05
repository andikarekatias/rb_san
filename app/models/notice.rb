class Notice < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
