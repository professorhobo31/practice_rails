class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false    # The null: false checks the email attribute not to be empty at a DB level
      t.string :password_digest

      t.timestamps
    end
  end
end
