class ClasslistController < ApplicationController

  def show
    @time_schedules = Classlist.all
  end

  def when_day_show #show
    @day_datas = DayDatum.all
  end

  def day_show

    require 'nokogiri'
    require 'open-uri'
    require 'bundler'

    url = "https://syllabus.kyoto-su.ac.jp/syllabus_search/"
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    agent = Mechanize.new
    agent.page.link_with(:text => "検索").buttons


  end

  def when_day
    # File.open("data2.text") {|f|
    #   # for num in 100 #1996
    #   1996.times do |i|
    #     @day_data = DayDatum.new
    #     str = p f.gets # 1行目
    #     strArray = str.split(",")
    #     @day_data.id = strArray[13].delete("^0-9")
    #     @day_data.name = strArray[2]
    #     @day_data.class_condition = strArray[14][/\（".*?"\）/]
    #     @day_data.save
    #   end
    # }

    redirect_to('/classlist/when_day_show')
  end

  def scraiping
    for num in 1..5 do
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
