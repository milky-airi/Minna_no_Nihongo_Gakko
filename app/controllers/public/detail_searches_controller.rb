class Public::DetailSearchesController < ApplicationController

  def detail_search
    @prefecture = params[:prefecture]
    @nationalities = params[:nationality]&.split(' ')
    @anual_fee_greater_than_or_equal = params[:anual_fee_greater_than_or_equal]
    @anual_fee_less_than = params[:anual_fee_less_than]
    @word = params[:word]
    @schools = School.look_detail_for(@prefecture, @nationalities, @anual_fee_greater_than_or_equal, @anual_fee_less_than, @word)
  end

end
