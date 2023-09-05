class Admin::AlertsController < ApplicationController

  def index
    @alerts = Alert.all
  end

  def show
  end

  def done
  end
end
