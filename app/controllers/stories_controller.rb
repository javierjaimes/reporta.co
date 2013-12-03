class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    if params.key? :filter
      @stories = Story.joins(:followers).order( 'stories.created_at DESC' ).where( :followers => { :user_id  => current_user.id } ).paginate( :page => params[:page], :per_page => 10 )
    else
      @stories = Story.order( 'stories.created_at DESC' ).paginate( page: params[ :page ], per_page: 10 )
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @extends  = Extend.includes( :user ).limit(10).where( story: @story ).paginate( page: params[:page], per_page: 10 ) 
    @following = Follower.find_by( user: current_user, story: @story )
    puts @following
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    # validation the user
    if params[:story][:user_id] && User.find(params[ :story ][ :user_id ]) != current_user
      raise "This operation could be done"
    end

    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.includes(:user, :extends).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:body, :user_id)
    end
end
