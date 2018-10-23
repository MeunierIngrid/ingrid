ActiveAdmin.register Answer do

  actions :index, :show, :edit
  permit_params :survey, :question, :score

  show do
    attributes_table do
      row :survey
      row :question
      row :score
    end
  end

  filter :survey
  filter :score

end
