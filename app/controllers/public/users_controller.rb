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
    # 再登録できるよう、ユーザーのメールアドレスを一意なものに変更
    current_user.skip_reconfirmation!
    unique_email = "deleted_" + Time.now.to_i.to_s + current_user.email
    current_user.update(email: unique_email, is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました"
    redirect_to root_path
  end

  def favorited
    @favorites = current_user.favorites
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :job, :graduated_at, :school_id, :country_code, :profile_image)
    end

end
