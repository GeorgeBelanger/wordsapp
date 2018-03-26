class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :password_confirmation
      t.string :password_salt
      t.string :password_hash
      t.string :remember_token
      t.string :confirmation_token
      t.string :profile_picture
      t.string :languages, array:true, default: []

      t.timestamps
    end
  end
end
