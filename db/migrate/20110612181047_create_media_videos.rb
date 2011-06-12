class CreateMediaVideos < ActiveRecord::Migration
  def change
    create_table :media_videos do |t|
      t.references      :owner, :polymorphic => true
      t.integer         :type_id, :default => MediaVideo::MEDIA_TYPES::YOUTUBE
      t.string          :video_key
      t.timestamps
    end
  end
end
