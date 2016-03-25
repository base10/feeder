class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.text :description
      t.text :url, null: false
      t.belongs_to :user, null: false
    end

    add_index :publications, [:user_id, :name], unique: true
    add_index :publications, [:user_id, :url], unique: true
    add_foreign_key :publications, :users
  end
end
