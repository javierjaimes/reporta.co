class DashboardController < ApplicationController
  def index
    @stories = Story.all
    @user_stories = Story.where( user: current_user )
  end
end
