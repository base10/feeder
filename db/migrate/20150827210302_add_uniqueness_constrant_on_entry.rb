class AddUniquenessConstrantOnEntry < ActiveRecord::Migration
  def change
    add_index :entries, [:feed_id, :url], unique: true
  end
end
