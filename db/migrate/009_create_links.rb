class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :mailing_id
      t.text :name
      t.text :url
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
