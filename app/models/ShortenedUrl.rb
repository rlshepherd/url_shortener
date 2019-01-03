require 'alphadecimal'

class ShortenedUrl < ActiveRecord::Base
 validates_presence_of :url
 validates_uniqueness_of :url

 # we also want to validate the url
 # 
 # this blog compares performance of difference solutions against urls:
 # https://mathiasbynens.be/demo/url-regex
 #
 # the best performing statement is 502 (!) characters long
 #
 # here is a link to the gist where these are discussed:
 # https://gist.github.com/dperini/729294

 validates_format_of :url, :with => /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i

 def shorten
 	self.id.alphadecimal
end