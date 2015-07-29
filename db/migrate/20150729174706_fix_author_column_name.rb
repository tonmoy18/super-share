class FixAuthorColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :author, :login_id
  end
end
