class AddIconToProject < ActiveRecord::Migration
  def change
    add_column :projects, :icon_file_name, :string
    add_column :projects, :icon_content_type, :string
  end
end
