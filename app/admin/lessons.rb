ActiveAdmin.register Lesson do
  belongs_to :course # Associe les leçons aux cours dans ActiveAdmin

  # Champs affichés dans la liste des leçons
  index do
    selectable_column
    id_column
    column :title
    column :content
    column :course
    column :created_at
    actions
  end

  # Formulaire pour créer ou modifier une leçon
  form do |f|
    f.inputs "Lesson Details" do
      f.input :course, as: :select, collection: Course.all
      f.input :title
      f.input :content
    end
    f.actions
  end
end