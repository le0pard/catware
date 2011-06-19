class CreatePdfAttachments < ActiveRecord::Migration
  def change
    create_table :pdf_attachments do |t|
      t.references    :owner, :polymorphic => true
      t.string        :title
      t.string        :pdf_file_name
      t.string        :pdf_content_type
      t.integer       :pdf_file_size
      t.datetime      :pdf_updated_at
      t.timestamps
    end
  end
end
