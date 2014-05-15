require 'rubygems'
require 'nokogiri'

page = Nokogiri::HTML(open("#{ARGV[0]}"))

ocr_words = []
ocr_elements = page.css('span.ocrx_word')
ocr_elements.each do |word|
  ocr_words << "#{word.text}|#{word['title'].gsub(/bbox /,'').gsub(/ /,',')}"
end
STDOUT.puts ocr_words.join(" ")
