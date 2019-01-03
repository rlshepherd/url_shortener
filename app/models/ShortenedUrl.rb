require 'alphadecimal'
require 'url_regex'

class ShortenedUrl < ActiveRecord::Base
  validates_presence_of :url
  validates_uniqueness_of :url

  # we also want to validate the url with regex, which is non-trivial.
  # 
  # this blog compares performance of difference solutions against urls:
  # https://mathiasbynens.be/demo/url-regex
  #
  # the best performing statement is 502 (!) characters long
  #
  # here is a link to the gist where these are discussed:
  # https://gist.github.com/dperini/729294
  #
  # here, it's easier to use the url_regex gem
  #
  # we have to require the schema (e.g. "http://") or redirect will fail.

  validates_format_of :url, :with => UrlRegex.get(mode: :validation)

  def shorten
 	# using base 64 keeps the shortened urls shorter even as the number of unique urls grows.
 	self.id.alphadecimal
  end

  def self.find_by_shortened(shortened)
    find(shortened.alphadecimal)
  end
end