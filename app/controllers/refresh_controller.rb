class RefreshController < ApplicationController
  def stories
    @stories = Story.includes(:user).find( params[ :refresh ][ :stories ] )
  end

  def following
    @extends = Extend.includes( :user ).order( 'extends.created_at DESC' ).find( params[:refresh ][ :stories ])
  end
end
