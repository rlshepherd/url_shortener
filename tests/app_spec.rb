require "spec_helper"

describe App do
  let(:app) { App.new }

  context "GET to /" do
    it "returns status 200 OK"
    it "displays an input tag for the long url"
    it "displays a submit tag"
  end

  context "GET to /:shortened" do
    it "checks if the shortened url exists"
    context "given a valid shortned url" do
      it "returns status 200 OK"
      it "redirects to the shortened url"
    end
    context "given an invalid shortened url"
      it "returns satus 200 OK"
      it "displays an non-existing shortened url error tag"
    end
  end

  context "POST to /" do
    context "given a valid long url" do
      it "returns a status 200 OK"
      it "displays a shortened url tag"
    end
    context "given an invalid long url" do
      it "returns status 200 OK"
      it "displays an invalid url error tag"
    end
  end
end