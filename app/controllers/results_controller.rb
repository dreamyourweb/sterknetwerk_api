class ResultsController < ApplicationController
  # POST /results
  # POST /results.json
  def create
    #p params
    if params[:results].present? && params[:results][:answers].present?
      answers = params[:results][:answers] 
      params[:results].delete :answers
    end

    p "Array?: " + params[:results][:aspects].is_a?(Array).to_s
    p "String?: " + params[:results][:aspects].is_a?(String).to_s
    
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
    respond_to do |format|
      format.html do
        render :layout => "report"
      end
      format.pdf do
        render :template => 'results/show.html.erb', :pdf => "file_name", :layout => "report"
      end
    end

  end
end