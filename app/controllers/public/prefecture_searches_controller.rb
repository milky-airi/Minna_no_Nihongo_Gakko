class Public::PrefectureSearchesController < ApplicationController

  def prefecture_search
    @prefecture = params[:prefecture]
    @schools = School.look_prefecture_for(@prefecture)
  end

end
