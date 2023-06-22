class PelabuhansController < ApplicationController
  before_action :set_pelabuhan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /pelabuhans or /pelabuhans.json
  def index
    @pelabuhans = Pelabuhan.includes(:user).all.order(created_at: :desc).page(params[:page]).per(5)
    add_breadcrumb('Pelabuhan', nil, true)
  end

  # GET /pelabuhans/1 or /pelabuhans/1.json
  def show
    add_breadcrumb('Pelabuhan', pelabuhans_path, false)
    add_breadcrumb(@pelabuhan.daerah, nil, true)
    add_breadcrumb(@pelabuhan.nama_pelabuhan, nil, true)
  end

  # GET /pelabuhans/new
  def new
    @pelabuhan = Pelabuhan.new
  end

  # GET /pelabuhans/1/edit
  def edit
  end

  # POST /pelabuhans or /pelabuhans.json
  def create
    @pelabuhan = Pelabuhan.new(pelabuhan_params)
    @pelabuhan.user = current_user

    respond_to do |format|
      if Pelabuhan.exists?(nama_pelabuhan: @pelabuhan.nama_pelabuhan)        
        format.html { redirect_to pelabuhan_url(@pelabuhan), alert: "Pelabuhan with the same name already exists." }
        format.turbo_stream { render :new, status: :unprocessable_entity, locals: { pelabuhan: @pelabuhan } }
        format.json { render json: @pelabuhan.errors, status: :unprocessable_entity }
      elsif @pelabuhan.save
        format.html { redirect_to pelabuhan_url(@pelabuhan), notice: "Pelabuhan was successfully created." }
        format.turbo_stream { render :create, locals: {pelabuhan: @pelabuhan} }
        format.json { render :show, status: :created, location: @pelabuhan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity, locals: {pelabuhan: @pelabuhan} }
        format.json { render json: @pelabuhan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pelabuhans/1 or /pelabuhans/1.json
  def update
    respond_to do |format|
      if @pelabuhan.update(pelabuhan_params)
        format.html { redirect_to pelabuhan_url(@pelabuhan), notice: "Pelabuhan was successfully updated." }
        format.json { render :show, status: :ok, location: @pelabuhan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pelabuhan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pelabuhans/1 or /pelabuhans/1.json
  def destroy
    @pelabuhan.destroy

    respond_to do |format|
      format.html { redirect_to pelabuhans_url, notice: "Pelabuhan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pelabuhan
      @pelabuhan = Pelabuhan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pelabuhan_params
      params.require(:pelabuhan).permit(:daerah, :nama_pelabuhan,)
    end
end
