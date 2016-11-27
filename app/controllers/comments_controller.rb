class CommentsController < ApplicationController
  before_action :if_not_owner_redirect_to_root, only: :destroy #to prevent automated DELETE req from deleting the content
  before_action :authenticate_user!, only: :create  

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    if @comment.valid?
      redirect_to root_path
    else
      flash[:error] = "Invalid attributes."
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) #id here refers to the comment id
    @comment.destroy
    redirect_to root_path
  end

  private 

  def if_not_owner_redirect_to_root
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
