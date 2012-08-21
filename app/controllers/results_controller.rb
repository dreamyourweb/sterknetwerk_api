class ResultsController < ApplicationController
  # POST /aspects
  # POST /aspects.json
  def create
    @results = Result.create(params[:results])

    respond_with(@results)

  end
end