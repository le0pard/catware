class AddLogoImgToProject < ActiveRecord::Migration
  def change
    add_column :projects, :logo_img_file_name,    :string
    add_column :projects, :logo_img_content_type, :string
    add_column :projects, :logo_img_file_size,    :integer
    add_column :projects, :logo_img_updated_at,   :datetime
  end
end
