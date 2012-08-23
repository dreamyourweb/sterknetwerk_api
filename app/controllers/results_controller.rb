class ResultsController < ApplicationController
  # POST /results
  # POST /results.json
  def create
    #p params
    if params[:results].present? && params[:results][:answers].present?
      answers = params[:results][:answers] 
      params[:results].delete :answers
      #params[:aspects]=params[:aspects]+1
    end

    #p "Array?: " + params[:results][:aspects].is_a?(Array).to_s
    #p "String?: " + params[:results][:aspects].is_a?(String).to_s
    
    @results = Result.create(params[:results])
    if answers
      answers.each do |answer|
        @results.answers.build(answer)
      end
    end

    if @results.save

    # @results.send_email
      @results.delay.send_email
    end

    respond_with(@results)
  end

  def show(override_id=nil)
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

  def show_string(id)
    params = Hash.new
    params[:id] = id.to_s
    params[:format] = "html"

    @aspects = Aspect.all(:include => :questions)
    @result = Result.find(params[:id])
    if @result.company_name == "" || @result.company_name.nil?
      @company_name = "Bedrijf"
    else
      @company_name = @result.company_name
    end

    render_to_string :template => 'results/show.html.erb', :layout => 'report'
  end

end 