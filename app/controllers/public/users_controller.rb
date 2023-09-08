class Public::UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:destroy, :update]
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

  # def confirm_email
  #   if @user = User.find_by(confirmation_token: params[:token])
  #     unless @user.expired?
  #       @user.activate
  #     end
  #   end
  # end
#
  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code, :profile_image)
    end

    def ensure_normal_user
      if current_user.email == 'guest@example.com'
        flash[:notice] = "ゲストユーザーの情報変更はできません。"
        redirect_to user_path(current_user)
      end
    end

end
