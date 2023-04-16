class AddAttachmentToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :photo, :binary
  end
end
