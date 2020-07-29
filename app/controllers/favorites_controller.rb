class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find_by(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をいいねしました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find_by(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'いいねを外しました。'
    redirect_to root_url
  end
  
end
