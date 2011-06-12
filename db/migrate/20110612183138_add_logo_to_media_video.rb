class AddLogoToMediaVideo < ActiveRecord::Migration
  def change
    add_column :media_videos, :logo_file_name,    :string
    add_column :media_videos, :logo_content_type, :string
    add_column :media_videos, :logo_file_size,    :integer
    add_column :media_videos, :logo_updated_at,   :datetime
  end
end
