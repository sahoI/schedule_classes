class RegistrationController < ApplicationController
  def index
    @class = Register.find_by(id:1)
  end

  def create
    @class = Register.new(post_params)
    if @class.save
      flash[:notice] = "登録しました"
      redirect_to("/registration/index")
    else
      flash[:notice] = "登録できませんでした"
      render("/registration/mon")
    end
  end
  def post_params
    params.require(:registrate).permit(:name)
  end
  def show
    @classes = Register.search(params[:num])

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
end
