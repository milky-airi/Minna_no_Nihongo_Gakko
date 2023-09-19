class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @school = School.find(params[:school_id])
    favorite = current_user.favorites.new(school_id: @school.id)
    favorite.save
  end

  def destroy
    @school = School.find(params[:school_id])
    favorite = Favorite.find_by(school_id: @school.id)
    favorite.destroy
  end
end
