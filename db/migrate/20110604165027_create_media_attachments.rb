class CreateMediaAttachments < ActiveRecord::Migration
  def change
    create_table :media_attachments do |t|
      t.references    :owner, :polymorphic => true
      t.string        :media_file_name
      t.string        :media_content_type
      t.integer       :media_file_size
      t.datetime      :media_updated_at
      t.timestamps
    end
  end
end
