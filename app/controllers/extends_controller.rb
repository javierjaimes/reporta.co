class ExtendsController < ApplicationController
  before_action :set_extend, only: [:show, :edit, :update, :destroy]

  # GET /extends
  # GET /extends.json
  def index
    @extends = Extend.all
  end
  #
  # GET /sotory/1/extends
  # GET /story/1/extends.json
  def paginate
    @extends = Extend.order( 'created_at DESC' ).where( story_id: params[ :id ] ).paginate( :page => params[ :page ], :per_page => 5 )
    puts @extends.current_page
    puts @extends.total_pages
    respond_to do |format|
      format.json { render action: 'paginate', status: :ok }
    end
    @extends = Extend.all
  end

  # GET /extends/1
  # GET /extends/1.json
  def show
  end

  # GET /extends/new
  def new
    @extend = Extend.new
    render layout: 'stories' 
  end

  # GET /extends/1/edit
  def edit
  end

  # POST /extends
  # POST /extends.json
  def create
    extend_params.delete( :user_id ) if @user = User.find( params[:extend][:user_id])
    extend_params.delete( :story_id ) if @story = Story.find( params[:extend][:story_id])

    if !@user.persisted? &&  @user != current_user
      raise "error"
    end

    if !@story.persisted?
      raise "error"
    end


    @extend = Extend.new(extend_params)
    @extend.user = @user
    @extend.story = @story

    respond_to do |format|
      if @extend.save
        format.html { redirect_to @extend, notice: 'Extend was successfully created.' }
        format.json { render action: 'show', status: :created, location: @extend }
      else
        format.html { render action: 'new' }
        format.json { render json: @extend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extends/1
  # PATCH/PUT /extends/1.json
  def update
    respond_to do |format|
      if @extend.update(extend_params)
        format.html { redirect_to @extend, notice: 'Extend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @extend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extends/1
  # DELETE /extends/1.json
  def destroy
    @extend.destroy
    respond_to do |format|
      format.html { redirect_to extends_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extend
      @extend = Extend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extend_params
      params.require(:extend).permit(:body, :user_id)
    end
end
