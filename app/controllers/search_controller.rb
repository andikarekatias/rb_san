class SearchController < ApplicationController
  def index
    @query = Pelabuhan.ransack(params[:q])
    @pelabuhans = @query.result(distinct: true).page(params[:page]).per(5)
    add_breadcrumb('Pencarian', nil, true)
  end
  def pelabuhan
    @query = Pelabuhan.ransack(params[:q])
    @pelabuhans = @query.result(distinct: true).page(params[:page]).per(5)
    add_breadcrumb('Pencarian', search_path, false)
    add_breadcrumb('Pelabuhan', nil, true)
  end
  def master_kapal
    @query = MasterKapal.ransack(params[:q])
    @master_kapals = @query.result(distinct: true).page(params[:page]).per(5)
  end
end
