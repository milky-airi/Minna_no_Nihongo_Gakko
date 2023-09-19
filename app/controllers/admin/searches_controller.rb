class Admin::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @schools = School.look_for(@word).page(params[:page]).per(10)
  end

end
