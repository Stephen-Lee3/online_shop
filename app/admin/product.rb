ActiveAdmin.register Product do
 permit_params :name, :price, :inventory, :picture, :introduction

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :inventory
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :inventory
      f.input :category
      f.input :picture
      f.input :introduction, as: :wysihtml5, commands: :all, blocks: :basic,height: :huge
    end
      f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
