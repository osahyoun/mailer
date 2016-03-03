class CreateSendingLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.integer :mailing_id
      t.integer :member_id
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
