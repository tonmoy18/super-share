class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_hash
      t.integer :login_type

      t.timestamps
    end
  end
end
