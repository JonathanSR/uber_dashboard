class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :promo_code
      t.string :token
      t.string :refresh_token
      t.boolean :expires

      t.timestamps
    end
  end
end
