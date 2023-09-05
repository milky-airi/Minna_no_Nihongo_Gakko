class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:destroy, :update]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(user)
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
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code)
    end

    def ensure_normal_user
      if current_user.email == 'guest@example.com'
        flash[:notice] = "ゲストユーザーの情報変更はできません。"
        redirect_to user_path(current_user)
      end
    end
end
