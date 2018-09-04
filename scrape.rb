require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://qiita.com/search?utf8=%E2%9C%93&sort=&q=python'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//h1[@class="searchResult_itemTitle"]').each do |node|
  p node.css('a').inner_text
end