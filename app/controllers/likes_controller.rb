class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def show
    @microposts = current_user.feed_likes.order('created_at DESC').page(params[:page])
  end

  def create
   micropost = Micropost.find(params[:micropost_id])
   current_user.like(micropost)
    flash[:success] = 'likeしました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'likeを解除しました。'
    redirect_to root_url
  end
end
