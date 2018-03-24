class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :remember_token
      t.string :confirmation_token
      t.string :profile_picture

      t.timestamps
    end
  end
end
