class AddSqdToMailings < ActiveRecord::Migration
  def self.up
    change_table :mailings do |t|
      t.text :sqd
    end
  end

  def self.down
    change_table :mailings do |t|
      t.remove :sqd
    end
  end
end
