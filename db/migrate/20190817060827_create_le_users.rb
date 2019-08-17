class CreateLeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :le_users do |t|
      t.string :username
      t.string :hdaname
      t.string :domain
      t.string :status

      t.timestamps
    end
  end
end
