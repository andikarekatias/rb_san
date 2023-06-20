class NoticesController < ApplicationController
  before_action :set_notice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user, except: %i[index show]

  # GET /notices or /notices.json
  def index
    @notices = Notice.includes(:user, :rich_text_body).all.order(created_at: :desc).page(params[:page]).per(5)
  end

  # GET /notices/1 or /notices/1.json
  def show
    @comments = @notice.comments.includes(:user, :rich_text_body).order(created_at: :desc)

    mark_notifications_as_read
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # notice /notices or /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user    

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notice_url(@notice), notice: "Notice was successfully created." }
        format.turbo_stream { render :create, locals: {notice: @notice} }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity, locals: {notice: @notice} }
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

  def authorize_user
    notice = @notice || Notice
    authorize notice
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the notice_path, and we should do
      # a 301 redirect that uses the current friendly id.
      redirect_to @notice, :status => :moved_permanently if params[:id] != @notice.slug       
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
