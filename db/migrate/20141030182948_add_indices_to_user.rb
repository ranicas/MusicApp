class AddIndicesToUser < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end
