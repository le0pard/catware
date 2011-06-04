class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer   :type_id, :delault => Project::TYPE::WEB
      t.string    :title, :null => false
      t.text      :short_description
      t.text      :full_description
      t.string    :project_name
      t.timestamps
    end
  end
end
