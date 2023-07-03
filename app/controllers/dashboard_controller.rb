class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index    
    @notices = Notice.all.order(created_at: :desc).limit(5)    
  end
  def routes
    @routes = Rails.application.routes.routes.sort_by do |route|
      route.defaults[:controller] || ''
    end
  end
  protected

  def unauthenticated!
    redirect_to new_user_session_path
  end  

  def pelabuhans
    
  end

  def notices
  end

  def comments  
  end

  def users
    
  end

  def show_notice
    
  end


end
