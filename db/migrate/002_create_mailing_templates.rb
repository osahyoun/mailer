class CreateMailingTemplates < ActiveRecord::Migration
  def self.up
    create_table :mailing_templates do |t|
      t.text :name
      t.text :body_html
      t.text :body_plain
      t.text :subject
      t.text :sqd
      t.timestamps
    end
  end

  def self.down
    drop_table :mailing_templates
  end
end
