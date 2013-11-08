class DashboardController < ApplicationController
  def index
    @stories = Story.all
    @following = Follower.includes( :story ).where( user: current_user )
    puts @following
    @user_stories = Story.where( user: current_user )
  end
end
