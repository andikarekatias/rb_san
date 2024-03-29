class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :set_breadcrumbs
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    before_action :set_notifications, if: :current_user
    layout :set_layout
    before_action :set_query
    before_action :set_page_title
    before_action :set_indonesian_days_and_months

    def set_query
        @query = Pelabuhan.ransack(params[:q])
    end

    def add_breadcrumb(label, path, current = false)
        @breadcrumbs << {
            label: label,
            path: path,
            current: current
        }
    end

    def set_breadcrumbs
        @breadcrumbs = []
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
        notifications = Notification.includes(:recipient).where(recipient: current_user).newest_first.limit(9)
        @unread = notifications.unread
        @read = notifications.read
    end

    def set_page_title
        @page_title = format_page_title(request.original_url)
        if @page_title == "- "
            @page_title = "- Dashboard"
        end
    end

    def format_page_title(url)
        # Extract the relevant portion of the URL
        extracted_title = url.gsub(/https?:\/\/[^\/]+\/?/, '')
    
        # Format the page title as desired
        formatted_title = extracted_title.split('/').map(&:capitalize).join(' ~ ')

        formatted_title = "- #{formatted_title}"
    
        # Return the formatted page title
        formatted_title
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_back(fallback_location: root_path)
    end

    def set_indonesian_days_and_months
        @indonesian_days = {
          'Sunday' => 'Minggu',
          'Monday' => 'Senin',
          'Tuesday' => 'Selasa',
          'Wednesday' => 'Rabu',
          'Thursday' => 'Kamis',
          'Friday' => 'Jumat',
          'Saturday' => 'Sabtu'
        }
    
        @indonesian_months = {
          'January' => 'Januari',
          'February' => 'Februari',
          'March' => 'Maret',
          'April' => 'April',
          'May' => 'Mei',
          'June' => 'Juni',
          'July' => 'Juli',
          'August' => 'Agustus',
          'September' => 'September',
          'October' => 'Oktober',
          'November' => 'November',
          'December' => 'Desember'
        }
      end

end
