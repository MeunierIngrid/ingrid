ActiveAdmin.register Survey do

  actions :index, :show, :destroy
  index do
    selectable_column
    column :email
    column :created_at
    column "Score" do |survey|
      survey.total_score.round(2)
    end
    column "Lien" do |survey|
      link_to "page de résultats", survey_path(survey.token)
    end
    actions
  end

  show do
    panel "Answers" do
      table_for survey.answers.order_by_categories do
        column "Question id" do |answer|
          answer.question.id
        end
        column :question
        column :score
      end
    end
  end


end
