ActiveAdmin.register Book do

  permit_params :title, :token, :cover

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      # f.input :token
      f.input :cover, as: :file
      f.button :submit
    end
  end

end
