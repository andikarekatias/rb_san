class DashboardController < ApplicationController
  before_action :authenticate_user!

  protected

  def unauthenticated!
    redirect_to new_user_session_path
  end

  def index
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
