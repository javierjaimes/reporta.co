class PagesController < ApplicationController
  def index
    uri = 'redis://redistogo:f036d899ead93963b8e414c21f13154e@koi.redistogo.com:10373/'
     puts URI.parse(URI.encode(uri.strip))
  end

  def what
  end

  def who
  end

  def how
  end
end
