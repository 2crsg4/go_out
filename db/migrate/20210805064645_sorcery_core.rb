class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name,         null: false
      t.string :nickname
      t.integer :role, default: 0, null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                 null: false
    end

    add_index :users, :user_name, unique: true
  end
end
