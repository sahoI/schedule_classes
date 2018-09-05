class WethreappController < ApplicationController
  def index
  end

  def show
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
    @title = p doc.xpath('//td[@class="syllabus_item_left syllabus_frame_TRB"]/span[@class="font_data"]').text
    @teacher = p doc.xpath('//td[@class="syllabus_item_left syllabus_frame_RB"]/span[@class="font_data"]').text
    tds = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_LRB space_top_bottom"]')
    @value = p tds[6].text
    @textbook = p tds[7].text

  end
  def scraipe
    require "open-uri"
    require "rubygems"
    require "nokogiri"

    url = "http://eiga.com/movie/55975/"
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    # doc.xpath('//adiv[@class="moveInfoBox"]/h2').each do |node|
      #title
      @title = p doc.title

      #released_at
      @released_at = p doc.xpath('//div[@class="moveInfoBox"]/span[@class="opn_date"]/strong').text

      #releaset_at (YYYY-MM-DD)
      @releaset_at = p doc.xpath('//div[@class="moveInfoBox"]/span[@class="opn_date"]/strong').attribute("content").value

      #image_url
      @image_url = p doc.xpath('//div[@class="pictBox"]/a/img[@class="main"]').attribute("src").value

      #thumbs
      @thumbs = doc.xpath('//p[@class="thumBox"]/a')
      @thumbs_size = p @thumbs.size
      # @thumbs.each do |thumb|
      #   @thumb = p thumb.xpath('img').attribute('src')
      # end

      #description
      @description = p doc.xpath('div[@class="outline"]')

      #staff
      staffs = doc.xpath('div[@class="staffcast"]/div[@class="staffBox"]/dl/dd/a')
      staffs.each do |staff|
        @staff = p staff.text
      end

      #casts
      casts = doc.xpath('div[@class="staffcast"]/div[@class="castBox"]/ul/li/span/a')
      casts.each do |cast|
        @cast = p cast.text
      end
    end
  # end
end

