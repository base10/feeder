class AddPublicationToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :publication_id, :integer
    add_foreign_key :feeds, :publications
  end
end
