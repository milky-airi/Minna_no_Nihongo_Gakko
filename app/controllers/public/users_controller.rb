class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
  end

  def confirm_quit
  end

  def quit
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code)
    end
end
