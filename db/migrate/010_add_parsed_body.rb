class AddParsedBody < ActiveRecord::Migration
  def self.up
    change_table :mailings do |t|
      t.text :parsed_html
    end
  end

  def self.down
    change_table :mailings do |t|
      t.remove :parsed_html
    end
  end
end
