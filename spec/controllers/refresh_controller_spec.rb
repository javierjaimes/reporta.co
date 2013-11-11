require 'spec_helper'

describe RefreshController do

  describe "GET 'stories'" do
    it "returns http success" do
      get 'stories'
      response.should be_success
    end
  end

  describe "GET 'following'" do
    it "returns http success" do
      get 'following'
      response.should be_success
    end
  end

end
