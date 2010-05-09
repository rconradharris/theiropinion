class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :submitter
      t.string :email
      t.string :subject
      t.text :body
      t.string :method, :null => false
      t.boolean :is_read, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
