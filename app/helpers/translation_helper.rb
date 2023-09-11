module TranslationHelper

  def translate_text(text, target_language_code)
    translate_client = Aws::Translate::Client.new(
      region: ENV['AWS_REGION'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )

    response = translate_client.translate_text({
      text: text,
      source_language_code: "auto",
      target_language_code: target_language_code
    })

    response.translated_text
  end
end
