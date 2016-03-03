class AddMailingTemplateIdToMailing < ActiveRecord::Migration
  def self.up
    change_table :mailings do |t|
      t.integer :mailing_template_id
    end
  end

  def self.down
    change_table :mailings do |t|
      t.remove :mailing_template_id
    end
  end
end
