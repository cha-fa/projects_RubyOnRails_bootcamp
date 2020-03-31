require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'



def fetching_symbol
a_symbol = [] #array des symbol
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
doc.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]').each do |node|
 a_symbol << node.text
end
return a_symbol
end 



def fetching_price
a_price = [] #array des prices
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
doc.xpath('//td[@class = "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a[@class = "cmc-link"]').each do |node|
 a_price << node.text
end
return a_price
end 




def create_array (a_symbol, a_price)
  array_of_hashes = Array.new

  (0...a_symbol.size).each do |num|
    key = a_symbol[num]
    value = a_price[num]
    result = Hash.new
    result[key]= value
    array_of_hashes << result
  end
  print array_of_hashes
  return array_of_hashes
end


def perform
  a_symbol = fetching_symbol
  a_price = fetching_price
  create_array(a_symbol, a_price)
end 
perform


