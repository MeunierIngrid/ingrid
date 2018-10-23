ActiveAdmin.register QuestionsCategory do

  actions :index, :show, :edit
  permit_params :title, :content, :visible

end
