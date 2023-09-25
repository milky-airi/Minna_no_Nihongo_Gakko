class Admin::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @schools = School.look_for(@word, admin_signed_in?).page(params[:page]).per(10)
  end

end
