class Public::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def confirm_quit
  end

  def quit
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :name_kana, :job, :graduated_at, :school_id, :country_code)
    end
end
