class DashboardController < ApplicationController
  def index
    @stories = Story.includes(:user).order( 'stories.created_at DESC' ).all
    @following = Follower.includes( :story ).where( user: current_user )
    @user_stories = Story.where( user: current_user )
  end
end
