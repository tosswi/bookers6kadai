class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :correct_user, only: [:edit,:update]

    def top
    if current_user
        redirect_to user_path(current_user)
    end
  end


  def show
    @user=User.find(params[:id])
    @books = User.find(params[:id]).books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @user=current_user
end
  def edit
  	user = User.find(params[:id])
  end

  def update
    @book = Book.new
    @books=Book.all
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id), notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end
  def followerindex
    @user=User.find(params[:user_id])
  end
  def followindex
    @user=User.find(params[:user_id])
  end
  def destoy
        @user = User.find(params[:id])
    followings = current_user.unfollow(@user)
    if followings.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to users_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to users_path
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def correct_user
  @user=User.find(params[:id])
  redirect_to user_path(current_user) unless @user == current_user
end
end
