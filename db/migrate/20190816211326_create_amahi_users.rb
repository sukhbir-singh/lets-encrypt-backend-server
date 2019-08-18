class CreateAmahiUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :amahi_users do |t|
        t.string :api_key
        t.string :username

        t.timestamps
    end
  end
end
