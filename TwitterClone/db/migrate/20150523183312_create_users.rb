class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
