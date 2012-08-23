class ResultsController < ApplicationController
  # POST /results
  # POST /results.json
  def create
    #p params
    if params[:results].present? && params[:results][:answers].present?
      answers = params[:results][:answers] 
      params[:results].delete :answers
    end
    @results = Result.create(params[:results])
    if answers
      answers.each do |answer|
        @results.answers.build(answer)
      end
    end
    @results.save
    respond_with(@results)
  end

  def show
    @aspects = Aspect.all(:include => :questions)
    @result = Result.find(params[:id])
    if @result.company_name == "" || @result.company_name.nil?
      @company_name = "Bedrijf"
    else
      @company_name = @result.company_name
    end
    render :layout => "report"
  end
end