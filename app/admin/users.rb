ActiveAdmin.register User do

  permit_params :email,
                :first_name,
                :last_name,
                :phone,
                :admin

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :admin
    end
  end

end
