class Classlist < ApplicationRecord
  # def self.scraiping(num)
  #   # @class = Classlist.new
  #   require 'nokogiri'
  #   require 'open-uri'
  #
  #   url = "https://syllabus.kyoto-su.ac.jp/syllabus/html/2018/#{num}.html"
  #
  #   charset = nil
  #   html = open(url) do |f|
  #     charset = f.charset # 文字種別を取得
  #     f.read # htmlを読み込んで変数htmlに渡す
  #   end
  #
  #   # ノコギリを使ってhtmlを解析
  #   doc = Nokogiri::HTML.parse(html, nil, charset)
  #   trb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_TRB"]/span[@class="font_data"]')
  #   @class.name = p trb[0].text
  #   @class.number = p trb[2].text
  #   rb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_RB"]/span[@class="font_data"]')
  #   # @class.season = p rb[0].text
  #   @class.department = p rb[1].text
  #   # @class.grade = p rb[2].text
  #   # @class.credit = p rb[3].text
  #   @class.teacher = p rb[4].text
  #   tds = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_LRB space_top_bottom"]')
  #   # @class.value = p tds[6].text
  #   @class.text = "教科書"
  #   @class.day = "月曜日"
  #   @class.class = 1
  #   # @textbook = p tds[7].text
  #   # link = doc.xpath('//table[@class="tbl_common tbl_cellspacing_0"]').xpath('//tr')[31].search('input/@onclick')
  #   # @link = p link
  # end
end
