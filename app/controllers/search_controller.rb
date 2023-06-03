class SearchController < ApplicationController
  def index
    @query = Pelabuhan.ransack(params[:q])
    @pelabuhans = @query.result(distinct: true)
  end
end
