class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_currentuser_id
  
  # GET /lists
  # GET /lists.json
  def index
    @lists = @user.lists.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = @user.lists.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = @user.lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = @user.lists.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = @user.lists.new(params[:list])

    respond_to do |format|
      if @list.save
        #format.html { redirect_to :action => "show", :id => @list.id }
        format.html { redirect_to user_lists_url(@user) }
        #format.html { redirect_to [@user, @list], notice: 'List was successfully created.' }
        format.json { render json: [@user, @list], status: :created, location: [@user, @list] }
      else
        format.html { render action: "new" }
#        format.json { render json: @user.list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @list = @user.lists.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to [@user, @list], notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    List.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to user_lists_url(@user) }
      format.json { head :no_content }
    end
  end
  
  
  
  private
    def get_currentuser_id
      @user = current_user
    end
end
