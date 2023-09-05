class Admin::HomesController < ApplicationController
  def top
    @schools = School.where(is_open: true)
  end
end
