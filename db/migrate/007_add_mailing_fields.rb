class AddMailingFields < ActiveRecord::Migration
  def self.up
    change_table :mailings do |t|
      t.text :from
      t.integer :campaign_id
      t.integer :list_id
    end
  end

  def self.down
    change_table :mailings do |t|
      t.remove :from
      t.remove :campaign_id
      t.remove :list_id
    end
  end
end
