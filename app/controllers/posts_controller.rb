class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.joins(:post_detail).select('posts.*, post_details.*').where('post_details.price = (SELECT MIN(post_details.price) FROM post_details)').all
  end

  def new_release
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.joins(:post_detail).select('posts.*, post_details.*').where(id: params[:post_id])
    end
end
