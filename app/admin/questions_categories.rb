ActiveAdmin.register QuestionsCategory do

  actions :index, :show, :edit, :update
  permit_params :title, :content, :visible

end
