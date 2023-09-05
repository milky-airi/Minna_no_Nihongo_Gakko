class Admin::AlertsController < ApplicationController

  def index
    @alerts = Alert.all
  end

  def show
  end

  def edit
  end

  def update
  end

end
