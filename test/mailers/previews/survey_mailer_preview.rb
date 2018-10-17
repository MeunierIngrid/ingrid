# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/survey_mailer/result
  def result
    SurveyMailer.result
  end

end
