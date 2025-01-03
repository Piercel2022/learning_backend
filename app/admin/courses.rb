ActiveAdmin.register Course do
  # Champs affichés dans la liste des cours
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  # Formulaire pour créer ou modifier un cours
  form do |f|
    f.inputs "Course Details" do
      f.input :title
      f.input :description
    end
    f.actions
  end

  # Afficher les détails d'un cours
  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :created_at
    end

    panel "Lessons" do
      table_for course.lessons do
        column :title
        column :content
      end
    end
  end
end

