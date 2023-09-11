$("#translate-page-btn").click(function(){
  let selectedLanguage = $("#language-select").val();

  let texts = $(".translatable-text").map(function(){
    return $(this).text();
  }).get();

  let csrfToken = $("meta[name='csrf-token']").attr("content");

  $.ajax({
    url: "/translate_page",  // サーバーのエンドポイント
    method: "POST",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', csrfToken)},
    data: {
      texts: texts,
      target_language: selectedLanguage
    },
    success: function(response) {
      // 翻訳されたテキストでページを更新
      $(".translatable-text").each(function(index){
        $(this).text(response.translated_texts[index]);
      });
    }
  });
});
