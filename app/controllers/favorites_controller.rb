class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_fav
  
  def create
    @micropost = Favorite.find(params[:micropost_id][:user_id])
    current_user.favorite(@micropost)
    flash[:success] = '投稿をいいねしました。'
    redirect_to @micropost
  end

  def destroy
    @micropost = Favorite.find(params[:micropost_id][:user_id])
    current_user.unfavorite(@micropost)
    flash[:success] = 'いいねを外しました。'
    redirect_to @micropost
  end
  
  private
  
  def set_fav
    @favorite = Favorite.find(params[:user_id, :micropost_id])
    @micropost = Favorite.find(params[:micropost_id])
  end
end
