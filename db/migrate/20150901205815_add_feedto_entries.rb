class AddFeedtoEntries < ActiveRecord::Migration
  def change
    add_foreign_key :entries, :feeds
  end
end
