class ClasslistController < ApplicationController

  def show
    # @classes = Register.search(params[:num])

    require 'nokogiri'
    require 'open-uri'

    url = 'https://syllabus.kyoto-su.ac.jp/syllabus/html/2018/3781.html'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # ノコギリを使ってhtmlを解析
    doc = Nokogiri::HTML.parse(html, nil, charset)
    trb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_TRB"]/span[@class="font_data"]')
    @name = p trb[0].text
    @number = p trb[2].text
    rb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_RB"]/span[@class="font_data"]')
    @season = p rb[0].text
    @department = p rb[1].text
    @grade = p rb[2].text
    @credit = p rb[3].text
    @teacher = p rb[4].text
    tds = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_LRB space_top_bottom"]')
    @value = p tds[6].text
    @textbook = p tds[7].text
  end
end
