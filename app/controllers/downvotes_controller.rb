class DownvotesController < ApplicationController
  before_action :authenticate_user! 

  def create
    @post = Post.find(params[:post_id])
    @post.unliked_by current_user
    redirect_to root_path
  end

end
