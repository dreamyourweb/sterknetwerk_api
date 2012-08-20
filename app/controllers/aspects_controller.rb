class AspectsController < ApplicationController
  # GET /aspects
  # GET /aspects.json
  def index
    @aspects = Aspect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aspects }
    end
  end

  # GET /aspects/1
  # GET /aspects/1.json
  def show
    @aspect = Aspect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aspect }
    end
  end

  # GET /aspects/new
  # GET /aspects/new.json
  def new
    @aspect = Aspect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aspect }
    end
  end

  # GET /aspects/1/edit
  def edit
    @aspect = Aspect.find(params[:id])
  end

  # POST /aspects
  # POST /aspects.json
  def create
    @aspect = Aspect.new(params[:aspect])

    respond_to do |format|
      if @aspect.save
        format.html { redirect_to @aspect, notice: 'Aspect was successfully created.' }
        format.json { render json: @aspect, status: :created, location: @aspect }
      else
        format.html { render action: "new" }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aspects/1
  # PUT /aspects/1.json
  def update
    @aspect = Aspect.find(params[:id])

    respond_to do |format|
      if @aspect.update_attributes(params[:aspect])
        format.html { redirect_to @aspect, notice: 'Aspect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aspects/1
  # DELETE /aspects/1.json
  def destroy
    @aspect = Aspect.find(params[:id])
    @aspect.destroy

    respond_to do |format|
      format.html { redirect_to aspects_url }
      format.json { head :no_content }
    end
  end
end
