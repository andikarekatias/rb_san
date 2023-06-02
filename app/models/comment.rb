class Comment < ApplicationRecord
  belongs_to :notice
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  def notify_recipient
    CommentNotification.with(comment: self, notice: notice).deliver_later(notice.user)
  end

  def cleanup_notifications
    notification_as_comment.destroy_all
  end

end
