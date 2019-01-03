require 'sinatra'
require 'sinatra/activerecord'
require './config/environment.rb'

get '/' do
end

post '/' do
end

get '/:shortened' do
  shortened_url = ShortenedUrl.find(params[:shortened])
  redirect shortened_url.url
end