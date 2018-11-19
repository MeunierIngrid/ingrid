ActiveAdmin.register Question do

  permit_params :title,
                :questions_category,
                :coefficient,
                :visible

  filter :title
  filter :coefficient
  filter :questions_category
  filter :created_at
  filter :updated_at
  filter :visible

end
