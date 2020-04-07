class FavoritesController < ApplicationController
def create
    @post_favorites = Favorite.new(user_id: current_user.id,post_id: params[:post_id])
    @post_favorites.save
    result = [done: "save",user_id: current_user.id, post_id: params[:post_id]]
    render :json => result
end

def destroy
    @post_favorites = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorites.destroy
    result = [done: "destroy",user_id: current_user.id, post_id:params[:post_id]]
    render :json => result
end
end