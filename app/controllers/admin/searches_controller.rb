class Admin::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @schools = School.look_for(@word)
  end

end
