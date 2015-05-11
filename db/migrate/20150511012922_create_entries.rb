class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.timestamps null: false
      t.string :headline, null: false
      t.string :authorship
      t.text :summary, null: false
      t.text :url, null: false
      t.text :notes
      t.datetime :published_at, null: false, default: Time.now

      t.belongs_to :feed, null: false
    end
  end
end
