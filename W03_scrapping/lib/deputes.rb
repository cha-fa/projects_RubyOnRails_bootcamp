require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

def get_deputees_urls
  url_deputees = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  doc.xpath('//div[@class="clearfix col-container"]/ul[@class="col3"]/li/a').each do |node|
   url_deputees << node["href"]
 end
 return url_deputees
end 


def get_deputees_name
  deputees_name = []
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  doc.xpath('//div[@class="clearfix col-container"]/ul[@class="col3"]/li/a').each do |node|
   deputees_name << node.text
 end
 return deputees_name
end 



def get_all_deputees_email(url_deputees)
  email_all = []
  url_deputees.each do |deputee|
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{deputee}"))
    doc.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |node|
     email_all << node.text
   end
 end
 return email_all
end 




def create_array_deputees(deputees_name, email_all)
  array_of_hashes = Array.new

  (0...deputees_name.size).each do |num|
    key = deputees_name[num]
    value = email_all[num]
    result = Hash.new
    result[key]= value
    array_of_hashes << result
  end
  print array_of_hashes
  return array_of_hashes
end



def perform
  url_deputees = get_deputees_urls
  deputees_name = get_deputees_name
  email_all = get_all_deputees_email(url_deputees)
  create_array_deputees(deputees_name, email_all)
end
perform