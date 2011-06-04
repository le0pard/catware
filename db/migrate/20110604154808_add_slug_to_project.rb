class AddSlugToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cached_slug, :string
  end
end
