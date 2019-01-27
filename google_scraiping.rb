require 'rubygems'
require 'mechanize'

agent = Mechanize.new
# page = agent.get('https://www.google.co.jp')
page = agent.get('http://bestgems.org/')
# form = page.forms[0]
# form.q = 'x2ch'
# p agent.submit(form)
elements = page.search('li a')

elements.each do |ele|
  puts ele.inner_text
end

# form = page.forms.first
#
# # name: q　に検索クエリを代入
#     form['q'] = 'do ruby'
#
# # 検索ボタンのクリック
# search_result = form.click_button
#
# p search_result.title
# => "doruby - Google 検索"