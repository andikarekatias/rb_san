class NoticesController < ApplicationController
  before_action :set_notice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  # GET /notices or /notices.json
  def index
    @notices = Notice.all.order(created_at: :desc)
  end

  # GET /notices/1 or /notices/1.json
  def show
    @comments = @notice.comments.order(created_at: :desc)

    mark_notifications_as_read
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices or /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully created." }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1 or /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully updated." }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1 or /notices/1.json
  def destroy
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_url, notice: "Notice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.require(:notice).permit(:title, :body, :user_id)
    end

    def mark_notifications_as_read
      if current_user
        notifications_to_mark_as_read = @notice.notifications_as_notice.where(recipient: current_user)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end      
    end

end
