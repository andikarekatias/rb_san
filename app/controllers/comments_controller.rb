class CommentsController < ApplicationController
    before_action :authenticate_user! 
    before_action :set_notice

    def create        
        @comment = @notice.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment created successfully"
            redirect_to notice_path(@notice)
        else
            flash[:notice] = "Comment has not been created"
            redirect_to notice_path(@notice)
        end

    end

    def destroy
        @comment = @notice.comments.find(params[:id])
        @comment.destroy
        redirect_to notice_path(@notice)
    end

    def update
        @comment = @notice.comments.find(params[:id])
        
        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to notice_url(@notice), notice: 'Comment has been updated' }
            else
                format.html { redirect_to notice_url(@notice), alert: 'Comment has not been updated' }
            end
        end
    end

    private

    def set_notice
        @notice = Notice.find(params[:notice_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
