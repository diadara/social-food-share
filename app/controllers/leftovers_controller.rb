class LeftoversController < ApplicationController

  before_filter :authenticate_user
  # GET /leftovers
  # GET /leftovers.json
  def index
    @leftovers = Leftover.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leftovers }
    end
  end

  def page
    @leftovers = Leftover.offset(10 * params[:page].to_i).limit(10)
    
    respond_to do |format|
      format.html #{ render :index }
      format.json { render json: @leftovers }
    end
  end

  # GET /leftovers/1
  # GET /leftovers/1.json
  def show
    @leftover = Leftover.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leftover }
    end
  end

  # GET /leftovers/new
  # GET /leftovers/new.json
  def new
    @leftover = Leftover.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leftover }
    end
  end

  # GET /leftovers/1/edit
  def edit
    @leftover = Leftover.find(params[:id])
  end

  # POST /leftovers
  # POST /leftovers.json
  def create
    @leftover = Leftover.new(params[:leftover])
    @leftover.user = current_user

    respond_to do |format|
      if @leftover.save
        format.html { redirect_to @leftover, notice: 'Leftover was successfully created.' }
        format.json { render json: @leftover, status: :created, location: @leftover }
      else
        format.html { render action: "new" }
        format.json { render json: @leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leftovers/1
  # PUT /leftovers/1.json
  def update
    @leftover = Leftover.find(params[:id])

    respond_to do |format|
      if current_user == @leftover.user and @leftover.update_attributes(params[:leftover])
        format.html { redirect_to @leftover, notice: 'Leftover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leftover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leftovers/1
  # DELETE /leftovers/1.json
  def destroy
    @leftover = Leftover.find(params[:id])
    @leftover.destroy if @leftover.user == current_user

    respond_to do |format|
      format.html { redirect_to leftovers_url }
      format.json { head :no_content }
    end
  end
end
