# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  
  def message
    @notice = Notice.find(params[:comment][:notice_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "<b> #{@user.name} </b> Commented on <b> #{@notice.title.truncate(10)} </b>"
  end
  
  def url
    notice_path(Notice.find(params[:comment][:notice_id]))
  end
end
