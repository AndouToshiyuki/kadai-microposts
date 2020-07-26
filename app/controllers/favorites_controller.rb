class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Favorites.find(params[:micropost_id],[:user_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をいいねしました。'
    redirect_to micropost
  end

  def destroy
    micropost = Favorites.find(params[:micropost_id],[:user_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'いいねを外しました。'
    redirect_to micropost
  end
  
end
