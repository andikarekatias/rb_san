class PelabuhansController < ApplicationController
  before_action :set_pelabuhan, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]
  # GET /pelabuhans or /pelabuhans.json
  def index
    @pelabuhans = Pelabuhan.all.order(created_at: :desc)
  end

  # GET /pelabuhans/1 or /pelabuhans/1.json
  def show
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
      if @pelabuhan.save
        format.html { redirect_to pelabuhan_url(@pelabuhan), notice: "Pelabuhan was successfully created." }
        format.json { render :show, status: :created, location: @pelabuhan }
      else
        format.html { render :new, status: :unprocessable_entity }
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
