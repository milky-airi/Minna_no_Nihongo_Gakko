FactoryBot.define do

  # テスト用データ
  factory :school do
    id {1}
    name {"旭川福祉専門学校"}
    name_kana {"あさひかわふくしせんもんがっこう"}
    name_en {"Asahikawa Welfare College"}
    summary {}
    station {"千代ヶ丘駅"}
    prefecture {"Hokkaido"}
    address {"上川郡東川町進化台"}
    building {}
    hp {"https://www.hokko.ac.jp/kyokufuku/"}
    facebook {}
    twitter {"https://twitter.com/fukusen_renger"}
    instagram {"https://www.instagram.com/fukusenkoho/"}
    tiktok {}
    youtube {}
    condition {}
    anual_fee {}
    have_dormitory {"false"}
    dormitory_fee {}
    is_open {"true"}
    image_from {}
    capacity {}
    created_at {Time.new}
    updated_at {Time.new}
  end

end
