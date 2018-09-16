class ClasslistController < ApplicationController

  def show
    @time_schedules = Classlist.all
  end

  def when_day
    @data = DayDatum.new
    # url = 'https://webrs.kyoto-su.ac.jp/sv/001/script/kitei_A0A03201701.js?1537106977430'
    # charset = nil
    #
    # html = open(url) do |f|
    #   charset = f.charset # 文字種別を取得
    #   f.read # htmlを読み込んで変数htmlに渡す
    # end
    # doc = Nokogiri::HTML.parse(html, nil, charset)
    # @data.day_of_the_week = 1
    # @data.time_schedule = 1
    File.read("app/view/classlist/datas.js")

  end
  def scraiping
    for num in 1..4218 do
      time_schedule = Classlist.new
      require 'nokogiri'
      require 'open-uri'

      url = "https://syllabus.kyoto-su.ac.jp/syllabus/html/2018/#{num}.html"

      charset = nil
      # html = open(url) do |f|
      #   charset = f.charset # 文字種別を取得
      #   f.read # htmlを読み込んで変数htmlに渡す
      # end

      begin
        _html = open(url) do |f|
          charset = f.charset # 文字種別を取得
          f.read # htmlを読み込んで変数htmlに渡す
        end
      rescue OpenURI::HTTPError
        sleep 1
        next
      end

      time_schedule.id = num
      # ノコギリを使ってhtmlを解析
      doc = Nokogiri::HTML.parse(_html, nil, charset)
      trb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_TRB"]/span[@class="font_data"]')
      time_schedule.name = p trb[0].text
      time_schedule.number = p trb[2].text
      rb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_RB"]/span[@class="font_data"]')
      time_schedule.season = p rb[0].text
      time_schedule.department = p rb[1].text
      time_schedule.grade = p rb[2].text
      time_schedule.teacher = p rb[4].text
      tds = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_LRB space_top_bottom"]')
      condition = 6 #条件
      if p tds[condition] == nil #6
        condition = 5
        if p tds[condition] == nil #5
          condition = 4
        end
      end
      time_schedule.evaluation = p tds[condition].text
      time_schedule.day_of_the_week = "月曜日"
      time_schedule.time_schedule = 1
      if p tds[7] == nil
        time_schedule.textbook = 'なし'
      else
        time_schedule.textbook = p tds[7].text
      end
      time_schedule.save
    end
    redirect_to('/classlist/show')
  end

  # def post_params
  #   params.require(:classlist).permit(:name, :number, :season, :department, :grade, :teacher, :textbook, :evaluation, :day_of_the_week, :time_schedule)
  # end
  def search
    #ViewのFormで取得したパラメータをモデルに渡す
    @datas = Classlist.search(params[:department])
  end

end
