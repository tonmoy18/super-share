class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :author_id # was later migrated to login_id

      t.timestamps
    end
  end
end
