class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :follows, :author_id, :login_id
  end
end
