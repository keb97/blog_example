ActiveAdmin.register User do
  permit_params :email


  index do
    column :name
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  # show do |s|
  #   attributes_table do
  #     row :name
  #     row :email
  #   end
  #   active_admin_comments
  # end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :sex
      f.input :age
      f.input :city
      f.input :state
      f.input :email
      f.input :password
   
    end
    f.actions
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
