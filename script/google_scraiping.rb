require 'mechanize'

agent = Mechanize.new
page = agent.get('https://syllabus.kyoto-su.ac.jp/syllabus_search/')
form = page.form_with(:name => 'search_searchActionForm')
form.kamokuMei = 'E'
form.rishuuNendo = '2018'
form.kaikouGakubu = '004'
# form.kyouinMeiRadio = 'SHIMEI'
form.youbi = '1'

# button = form.button_with(name: 'search_searchActionFrom')

login_page = agent.submit(form)

p login_page.links

# result = form.submit
# result.links.each do |link|
#   puts link.text
# end

# require 'mechanize'
# require 'nokogiri'
#
# URI = 'https://syllabus.kyoto-su.ac.jp/syllabus_search/'
#
# agent = Mechanize.new
# page = agent.get(URI)
# p page.body

# response = agent.post(URI, {
#   name: 'kaikouGakubu',
#   value: '004'
# })
#
# doc = Nokogiri::ML.parse(response.body)
# pp doc.css('docroot > array')[0].text.split("\n")
#
# agent.log = Logger.new $stderr
# page = agent.post(URI)
# pp page.header



