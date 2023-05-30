class PengumumenController < ApplicationController
  before_action :set_pengumuman, only: %i[ show edit update destroy ]

  # GET /pengumumen or /pengumumen.json
  def index
    @pengumumen = Pengumuman.all
  end

  # GET /pengumumen/1 or /pengumumen/1.json
  def show
  end

  # GET /pengumumen/new
  def new
    @pengumuman = Pengumuman.new
  end

  # GET /pengumumen/1/edit
  def edit
  end

  # POST /pengumumen or /pengumumen.json
  def create
    @pengumuman = Pengumuman.new(pengumuman_params)

    respond_to do |format|
      if @pengumuman.save
        format.html { redirect_to pengumuman_url(@pengumuman), notice: "Pengumuman was successfully created." }
        format.json { render :show, status: :created, location: @pengumuman }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pengumuman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pengumumen/1 or /pengumumen/1.json
  def update
    respond_to do |format|
      if @pengumuman.update(pengumuman_params)
        format.html { redirect_to pengumuman_url(@pengumuman), notice: "Pengumuman was successfully updated." }
        format.json { render :show, status: :ok, location: @pengumuman }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pengumuman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pengumumen/1 or /pengumumen/1.json
  def destroy
    @pengumuman.destroy

    respond_to do |format|
      format.html { redirect_to pengumumen_url, notice: "Pengumuman was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pengumuman
      @pengumuman = Pengumuman.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pengumuman_params
      params.require(:pengumuman).permit(:title, :body, :user_id)
    end
end
