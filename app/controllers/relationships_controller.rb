class RelationshipsController < ApplicationController
def follow

  current_user.follow(params[:follow_id])
  redirect_to root_path

end

def unfollow
  current_user.unfollow(params[:follow_id])
  redirect_to root_path
end

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to users_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to users_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to users_path
    end
  end

end