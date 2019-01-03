url_attributes = [
  { url: "http://www.piccollage.com/"}
]

url_attributes.each do |attributes|
  ShortenedUrl.where(attributes).first_or_create
end