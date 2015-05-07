class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.text :url, null: false
      t.belongs_to :user, null: false
    end

    add_foreign_key :feeds, :users
  end
end
