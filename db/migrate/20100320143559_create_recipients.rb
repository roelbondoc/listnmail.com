class CreateRecipients < ActiveRecord::Migration
  def self.up
    create_table :recipients do |t|
      t.integer :list_id
      t.string :email

      t.string :key
      t.boolean :validated


      t.timestamps
    end
  end

  def self.down
    drop_table :recipients
  end
end
