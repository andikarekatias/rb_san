class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_user
    layout :set_layout
    before_action :set_query

    def set_query
        @query = Pelabuhan.ransack(params[:q])
    end

    private

    def set_layout
        if current_user
            "application"
        else
            "login"
        end
    end

    def set_notifications
        notifications = Notification.where(recipient: current_user).newest_first.limit(9)
        @unread = notifications.unread
        @read = notifications.read
    end

end
