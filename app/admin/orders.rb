ActiveAdmin.register Order do

  actions :index, :show
  permit_params :email,
                :book,
                :amount

  form do |f|
    f.inputs do
      f.input :email
      f.input :book
      f.input :amount
    end
  end

  show do
    attributes_table do
      row :email
      row :book
      row :amount
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :email
    column :book
    column :amount
    column :created_at
    column :updated_at
    actions
  end

end
