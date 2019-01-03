require "spec_helper"
require "./app/controllers/application_controller"
require 'rspec'
require 'rack/test'
require 'uri'

# RSpec::Matchers.define(:redirect_to) do |path|
#   match do |response|
#     uri = URI.parse(response.headers['Location'])
#     response.status.to_s[0] == "3" && uri.path == path
#   end
# end

describe ApplicationController do

  include Rack::Test::Methods
  
  let(:app) { ApplicationController.new }

  context "GET to /" do
    let(:response) { get "/" }

    it "returns status 200 OK" do
      expect(response.status).to eq 200
    end
    
    it "displays an input form" do
      expect(response.body).to include(
        '<input type="text" name="url" placeholder="url:">',
        '<input class="btn btn-primary" type="submit"'
      )
    end
  end

  context "POST to /" do
    context "given a valid url" do
      let(:response) { post "/", :url => "http://www.piccollage.com" }
      
      it "returns status 200 OK" do
      	expect(response.status).to eq 200
      end 
      it "displays a shortened url tag" do
      	expect(response.body).to include(
      	  'http://'
      	)
      end
    end

    context "given a invalid url" do
      let(:response) { post "/", :url => "garbage in, garbage out" }
      it "displays a invalid url error tag" do 
      	expect(response.body).to include('<p class="invalid-url-error">')
      end
    end
  end

  context "GET to /:shortened" do
  	context ":shortened exists" do
  	# let(:response) { get "/1" }
      it "redirects to the full url" do
      	get "/1"
      	expect(last_response).to be_redirect   
  		follow_redirect!
  		expect(last_request.url).to eq 'http://www.piccollage.com/'
      end
    end

    context ":shortened does not exist" do
      # let(:response) { get "/999999999999999" }
      it "redirects to homepage" do
        get "/999999999999"
        expect(last_response).to be_redirect   
  		follow_redirect!
      	expect(last_response.body).to include(
          '<input type="text" name="url" placeholder="url:">',
          '<input class="btn btn-primary" type="submit"'
        ) 
      end
    end
  
  end
end

