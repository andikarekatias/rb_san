class SpksController < ApplicationController
  before_action :set_spk, only: %i[ show edit update destroy ]

  # GET /spks or /spks.json
  def index
    @spks = Spk.includes(:surat_penunjukan_attachment, :manifest_dock_origin_attachment, :spb_dock_origin_attachment).all    
    add_breadcrumb('SPK', nil, true)
  end

  # GET /spks/1 or /spks/1.json
  def show
    add_breadcrumb('SPK', spks_path, false)    
  end

  # GET /spks/new
  def new
    @spk = Spk.new
    @spk.generate_no_spk    
  end

  # GET /spks/1/edit
  def edit
  end

  # POST /spks or /spks.json
  def create
    @spk = Spk.new(spk_params)

    respond_to do |format|
      if @spk.save
        format.html { redirect_to spk_url(@spk), notice: "Spk was successfully created." }
        format.json { render :show, status: :created, location: @spk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spks/1 or /spks/1.json
  def update
    respond_to do |format|
      if @spk.update(spk_params)
        format.html { redirect_to spk_url(@spk), notice: "Spk was successfully updated." }
        format.json { render :show, status: :ok, location: @spk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spks/1 or /spks/1.json
  def destroy
    @spk.destroy

    respond_to do |format|
      format.html { redirect_to spks_url, notice: "Spk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spk
      @spk = Spk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spk_params
      params.require(:spk).permit(:kapal, :voyage, :kegiatan, :est_tiba, :est_berangkat, :pelabuhan, :surat_penunjukan, :manifest_dock_origin, :spb_dock_origin, :no_spk)
    end
end
