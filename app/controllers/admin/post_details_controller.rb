class Admin::PostDetailsController < ApplicationController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/post_details
  # GET /admin/post_details.json
  def index
    @admin_post_details = PostDetail.all
  end

  # GET /admin/post_details/1
  # GET /admin/post_details/1.json
  def show
  end

  # GET /admin/post_details/new
  def new
    @admin_post_detail = PostDetail.new
  end

  # GET /admin/post_details/1/edit
  def edit
  end

  # POST /admin/post_details
  # POST /admin/post_details.json
  def create
    @admin_post_detail = PostDetail.new(admin_post_params)

    respond_to do |format|
      if @admin_post_detail.save
        set_admin_post
        format.html { redirect_to edit_admin_post_url(@admin_post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @admin_post_detail }
      else
        format.html { render :new }
        format.json { render json: @admin_post_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_details/1
  # PATCH/PUT /admin/post_details/1.json
  def update
    respond_to do |format|
      if @admin_post_detail.update(admin_post_params)
        set_admin_post
        format.html { redirect_to edit_admin_post_url(@admin_post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_post_detail }
      else
        format.html { render :edit }
        format.json { render json: @admin_post_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_details/1
  # DELETE /admin/post_details/1.json
  def destroy
    @admin_post_detail.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_details_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post_details = PostDetail.where(post_id: params[:post_detail][:post_id])
      @admin_post_detail = PostDetail.find(params[:id])
      @admin_post = Post.find(params[:post_detail][:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_post_params
      params.require(:post_detail).permit(:post_id, :url, :price, :listing_company)
    end
end