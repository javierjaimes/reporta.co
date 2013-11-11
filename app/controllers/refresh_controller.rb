class RefreshController < ApplicationController
  def stories
    @stories = Story.includes(:user).find( params[ :refresh ][ :stories ] )
  end

  def following
  end
end
