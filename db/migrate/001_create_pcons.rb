class CreatePcons < ActiveRecord::Migration
  def self.up
    create_table :pcons do |t|
      t.text :name
      t.text :code
      t.timestamps
    end
  end

  def self.down
    drop_table :pcons
  end
end
