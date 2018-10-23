class SurveyMailer < ApplicationMailer
  def result(survey)
    @survey = survey
    @total_score = JSON.parse(@survey.backup)["total_score"].to_f
    @book = Book.find_by(slug: "1")
    attachments["#{@book.title}.pdf"] = open("https://res.cloudinary.com/#{ENV['CLOUDINARY_CLOUD_NAME']}/image/upload/l_text:Times_15:#{@survey.email},co_black,g_south,y_0.01,co_black,pg_2/#{@book.pdf.key}").read
    mail(to: @survey.email, subject: 'Résultat de votre test')
  end
end
