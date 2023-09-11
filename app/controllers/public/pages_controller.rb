class Public::PagesController < ApplicationController
  include TranslationHelper

  def translate_page
    target_language = params[:target_language]
    texts = params[:texts]

    translated_texts = texts.map do |text|
      translate_text(text, target_language)
    end

    render json: { translated_texts: translated_texts }
  end

end
