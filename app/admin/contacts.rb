ActiveAdmin.register Contact do

  actions :index, :show
  permit_params :first_name,
                :last_name,
                :age,
                :email,
                :hp,
                :rdv,
                :rdv_other,
                :informations,
                :other,
                :complement

end
