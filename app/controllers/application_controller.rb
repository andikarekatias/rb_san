class ApplicationController < ActionController::Base
    layout :set_layout

    private

    def set_layout
        if current_user
            "application"
        else
            "login"
        end
    end
end
