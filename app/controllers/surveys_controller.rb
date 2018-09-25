class SurveysController < ApplicationController
  skip_before_action :authenticate_user!

  def new

    # redirect to survey show if session is not empty?
    @survey = Survey.new
    session[:answers_attributes] = {} if session[:answers_attributes].nil?
    @question_number = 0
    set_total_scores
  end

  def create
    # session[:answers_attributes] = params.require(:survey)
    #       .permit(answers_attributes: {})[:answers_attributes]
    #       .to_h
    #       .map{|k, v| [k, v[:score].to_i]}
    #       .to_h
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey
    else
      raise
      redirect_to new_survey_path
      # message
    end
  end

  def show
  end

  def update_session
    # session[:answers_attributes] = JSON.parse(params[:session]).map{|k,v| [k, v.to_i]}.to_h
    @question_id = params[:question_id]
    @score = params[:score].to_i
    session[:answers_attributes][@question_id] = @score
    set_total_scores
  end

  private

  def survey_params
    params.require(:survey).permit(:email, answers_attributes: [:score, :question_id, :_destroy])
  end

  def set_total_scores
    session_qids = session[:answers_attributes].map{|k, v| k.to_i}
    @total_scores = QuestionsCategory.all.map do |questions_category|
      category_qids = questions_category.questions.map(&:id)
      total_score = (category_qids & session_qids).size * 100 / category_qids.size
      [ questions_category.title, total_score ]
    end.to_h
  end
end
