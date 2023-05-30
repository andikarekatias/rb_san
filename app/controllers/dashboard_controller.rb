class DashboardController < ApplicationController
  before_action :authenticate_user!

  protected

  def unauthenticated!
    redirect_to new_user_session_path
  end

  def index
  end
end
