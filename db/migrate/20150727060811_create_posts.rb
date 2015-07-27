class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post
      t.integer :author
      t.integer :cost

      t.timestamps
    end
  end
end
