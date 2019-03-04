class SurveysController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    # redirect to survey show if session is not empty?
    @survey = Survey.new
    session[:answers_attributes] = {} if session[:answers_attributes].nil?
    @question_number = 0
    @total_scores = QuestionsCategory.set_total_scores(session[:answers_attributes])
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      #SurveyMailer.result(@survey).deliver_now
      redirect_to survey_path(@survey.token)
    else
      redirect_to new_survey_path
      flash[:alert] = @survey.errors.messages.values.join(". ")
      # message
    end
  end

  def show
    survey_instance = Survey.find_by(token: params[:token])
    @email = survey_instance.email
    @survey = JSON.parse(survey_instance.backup)
  end

  def update_session
    @question_id = params[:question_id]
    @score = params[:score].to_i
    session[:answers_attributes][@question_id] = @score
    @total_scores = QuestionsCategory.set_total_scores(session[:answers_attributes])
  end

  private

  def survey_params
    params.require(:survey).permit(:email, answers_attributes: [:score, :question_id, :_destroy])
  end
end
