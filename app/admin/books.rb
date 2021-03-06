ActiveAdmin.register Book do

  permit_params :title, :token, :cover, :price, :abstract, :description, :pdf, :visible, :position, :slug

  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :ckeditor
      f.input :abstract
      f.input :price
      f.input :cover, as: :file
      f.input :pdf, as: :file
      f.input :visible
      f.input :position
      f.input :slug
      f.button :submit
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row :abstract
      row :price
      row :position
      row :slug
      row :cover do |book|
        image_tag display_cover(book)
      end
      row :pdf do |book|
        if book.pdf && book.pdf.attachment
          link_to "pdf", cl_image_path(book.pdf.key), target: "_blank"
        end
      end
      row :visible
    end
  end


end
