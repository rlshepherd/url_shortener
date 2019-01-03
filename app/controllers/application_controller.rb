require 'sinatra'
require 'sinatra/activerecord'
require './config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
  end

  get '/' do
  	erb :index
  end

  post '/' do
    @shortened_url = ShortenedUrl.find_or_create_by(url: params[:url])
    if @shortened_url.valid?
      erb :success
    else
      erb :index
    end
  end

  get '/:shortened' do
    shortened_url = ShortenedUrl.find(params[:shortened])
    redirect shortened_url.url
  end
end