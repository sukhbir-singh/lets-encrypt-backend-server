class CreateLetsEncryptLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :lets_encrypt_logs do |t|
        t.belongs_to :amahi_users, index: true
        t.string :status

        t.timestamps
    end
  end
end
