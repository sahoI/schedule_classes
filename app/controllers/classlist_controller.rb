class ClasslistController < ApplicationController

  def new
    # @class = Classlist.new
    # @class = Classlist.new(post_params)
  end
  def create
    @class = Classlist.new(post_params)

    # render plain: params[:classlist].inspect
    if @class.save
      # flash[:notice] = "登録しました"
      redirect_to("/classlist/show")
    else
      # flash[:notice] = "登録できませんでした"
      render("/classlist/new")
    end

    # require 'nokogiri'
    # require 'open-uri'
    #
    # url = "https://syllabus.kyoto-su.ac.jp/syllabus/html/2018/1.html"
    #
    # charset = nil
    # html = open(url) do |f|
    #   charset = f.charset # 文字種別を取得
    #   f.read # htmlを読み込んで変数htmlに渡す
    # end
    #
    # # ノコギリを使ってhtmlを解析
    # doc = Nokogiri::HTML.parse(html, nil, charset)
    # trb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_TRB"]/span[@class="font_data"]')
    # @classe.name = p trb[0].text
    # @classe.number = p trb[2].text
    # rb = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_RB"]/span[@class="font_data"]')
    # @classe.season = p rb[0].text
    # @classe.department = p rb[1].text
    # @classe.grade = p rb[2].text
    # @classe.credit = p rb[3].text
    # @classe.teacher = p rb[4].text
    # tds = doc.xpath('//td[@class="syllabus_item_left syllabus_frame_LRB space_top_bottom"]')
    # # @value = p tds[6].text
    # # @textbook = p tds[7].text
    # # link = doc.xpath('//table[@class="tbl_common tbl_cellspacing_0"]').xpath('//tr')[31].search('input/@onclick')
    # # @link = p link
  end
  def show
    @time_schedules = Classlist.all
    # @classes = Classlist.scraiping(1)
  end
  def post_params
    params.require(:classlist).permit(:name, :number, :department, :teacher, :textbook, :day_of_the_week, :time_schedule)
  end
end
