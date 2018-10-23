ActiveAdmin.register Survey do

  actions :index
  index do
    selectable_column
    column :email
    column "Lien" do |survey|
      link_to "page de résultats", survey_path(survey.token)
    end
    actions
  end

end
