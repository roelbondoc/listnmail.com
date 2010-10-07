class CreateSuppressions < ActiveRecord::Migration
  def self.up
    create_table :suppressions do |t|
      t.string :email
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :suppressions
  end
end
