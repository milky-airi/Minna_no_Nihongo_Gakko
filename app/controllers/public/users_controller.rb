class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path(user)
    else
      @user = current_user
      render :edit
    end
  end

  def confirm_quit
  end

  def quit
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def favorited
    @favorites = current_user.favorites
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code, :profile_image)
    end

end
