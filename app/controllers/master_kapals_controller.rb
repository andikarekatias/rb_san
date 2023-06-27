class MasterKapalsController < ApplicationController
  before_action :set_master_kapal, only: %i[ show edit update destroy ]

  # GET /master_kapals or /master_kapals.json
  def index
    @master_kapals = MasterKapal.includes(:surat_ukur_attachment, :surat_laut_attachment, :foto_kapal_attachment).all
  end

  # GET /master_kapals/1 or /master_kapals/1.json
  def show
  end

  # GET /master_kapals/new
  def new
    @master_kapal = MasterKapal.new
  end

  # GET /master_kapals/1/edit
  def edit
  end

  # POST /master_kapals or /master_kapals.json
  def create
    @master_kapal = MasterKapal.new(master_kapal_params)

    respond_to do |format|
      if @master_kapal.save
        format.html { redirect_to master_kapal_url(@master_kapal), notice: "Master kapal was successfully created." }
        format.json { render :show, status: :created, location: @master_kapal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @master_kapal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_kapals/1 or /master_kapals/1.json
  def update
    respond_to do |format|
      if @master_kapal.update(master_kapal_params)
        format.html { redirect_to master_kapal_url(@master_kapal), notice: "Master kapal was successfully updated." }
        format.json { render :show, status: :ok, location: @master_kapal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @master_kapal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_kapals/1 or /master_kapals/1.json
  def destroy
    @master_kapal.destroy

    respond_to do |format|
      format.html { redirect_to master_kapals_url, notice: "Master kapal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_kapal
      @master_kapal = MasterKapal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def master_kapal_params
      params.require(:master_kapal).permit(:nama_kapal, :bendera, :pemilik, :alamat_owner, :jenis_pelayaran, :jenis_kapal, :imo_number, :call_sign, :dwt, :gt, :loa, :draft_depan, :draft_belakang, :hp_mesin, :surat_ukur, :surat_laut, :foto_kapal)
    end
end
