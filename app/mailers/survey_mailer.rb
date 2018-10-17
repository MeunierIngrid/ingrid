class SurveyMailer < ApplicationMailer
  def result(survey)
    @survey = survey
    mail(to: @survey.email, subject: 'Résultat de votre test')
  end
end
