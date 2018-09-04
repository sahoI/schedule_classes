# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

require "nokogiri"

# スクレイピング先のURL
url = "http://eiga.com/movie/55975/"

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

staffs = doc.xpath('div[@class="staffcast"]/div[@class="staffBox"]/dl/dd/a')
staffs.each do |staff|
  p staff.text
end


# # タイトルを表示
# p doc.title
# tds=doc.xpath("//td")
# if tds.size == nil
#   puts("0")
# else
#   tds.size
# end
# # p doc.xpath('//td[property="og:site_name"]/@content').to_s