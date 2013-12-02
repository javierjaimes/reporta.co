class DashboardController < ApplicationController
  def index
    @stories = Story.includes(:user).order( 'stories.created_at DESC' ).paginate( :page => params[ :page ], :per_page =>  10 )

    #Set first story
    @first = Story.find_by( id: @stories.first.id )
    @first_exts = Extend.order( 'extends.created_at DESC' ).where( story: @first ).paginate( :page => params[:page], :per_page => 5 )
    
    @follower = @first.followers.find_by( user: current_user, story: @first )
    puts @follower.nil?

    @active = ( @follower.nil? == false )? 'active':''

    @following = Follower.includes( :story ).order( 'stories.created_at DESC' ).where( user: current_user ).paginate( :page => params[:page], :per_page => 10 )
    @user_stories = Story.where( user: current_user )
  end
end
