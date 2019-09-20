require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('https://syllabus.kyoto-su.ac.jp/syllabus_search/')

form = page.forms.first

form.field_with(:name => 'kaikouGakubu').value = '011'

search_result = form.click_button
elements = search_result.search('tbl_common')