class PostsController < ApplicationController
  before_action :if_not_owner_redirect_to_root, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  private

  def if_not_owner_redirect_to_root
    redirect_to root_path if Post.find(params[:id]).user != current_user
  end

  def post_params
    params.require(:post).permit(:user_id, :photo, :description)
  end

end
