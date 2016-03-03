class CreateMailings < ActiveRecord::Migration
  def self.up
    create_table :mailings do |t|
      t.text :name
      t.text :body_html
      t.text :body_plain
      t.text :subject
      t.integer :mailing_id
      t.integer :from_id
      t.timestamps
    end
  end

  def self.down
    drop_table :mailings
  end
end
