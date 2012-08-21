class ResultsController < ApplicationController
  # POST /aspects
  # POST /aspects.json
  def create
    p params
    @results = Result.create(params[:results])
    respond_with(@results)
  end

  def show
    @result = Result.first_or_initialize(:id => params[:id])
    render :layout => "report"
  end

end