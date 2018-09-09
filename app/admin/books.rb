ActiveAdmin.register Book do

  permit_params :title, :token, :cover, :price

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
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
      row :price
      row :cover do |book|
        image_tag url_for(book.cover)
      end
    end
  end


end
