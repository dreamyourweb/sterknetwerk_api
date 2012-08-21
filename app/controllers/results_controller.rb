class ResultsController < ApplicationController
  # POST /aspects
  # POST /aspects.json
  def create
    p params[:results]
     @results = Result.new(params[:results])

     respond_to do |format|
       if @results.save
         format.json { render json: @results, status: :created, location: @results }
       else
         format.json { render json: @results.errors, status: :unprocessable_entity }
       end
     end
   end

  def show
    @result = Result.first_or_initialize(:id => params[:id])
    render :layout => "report"
  end

end