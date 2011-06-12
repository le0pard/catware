class AddMetaToProjects < ActiveRecord::Migration
  def change
    add_column  :projects, :meta_keywords, :string
    add_column  :projects, :meta_description, :text
  end
end
