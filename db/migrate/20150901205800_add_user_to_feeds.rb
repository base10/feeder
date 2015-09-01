class AddUserToFeeds < ActiveRecord::Migration
  def change
    add_foreign_key :feeds, :users
  end
end
