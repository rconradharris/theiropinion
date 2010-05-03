class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :url, :null => false
      t.text :note
      t.string :submitter
      t.string :source
      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
