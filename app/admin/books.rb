ActiveAdmin.register Book do

  permit_params :title, :token, :cover, :price, :abstract, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :ckeditor
      f.input :abstract
      f.input :price
      # f.input :token
      f.input :cover, as: :file
      f.button :submit
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row :abstract
      row :price
      row :cover do |book|
        image_tag url_for(book.cover)
      end
    end
  end


end
