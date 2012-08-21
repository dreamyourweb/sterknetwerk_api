class ResultsController < ApplicationController
  # POST /aspects
  # POST /aspects.json
  def create
     @results = Result.new(params)

     respond_to do |format|
       if @results.save
         format.json { render json: @results, status: :created, location: @results }
       else
         format.json { render json: @results.errors, status: :unprocessable_entity }
       end
     end
   end

end