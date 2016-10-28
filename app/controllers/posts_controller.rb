class PostsController < ApplicationController
  before_filter :ensure_signed_in

  def index
    @posts = current_user.posts
  end

  def new
    @post.new
  end

  def create
    @post = Post.new(permitted_params.permit)
    current_user.posts << @post
    if @post.save
      flash[:success] = 'Post Queued successfully'
    else
      flash[:error] = 'Cannot save post'
    end
    redirect_to root_path
  end
end
