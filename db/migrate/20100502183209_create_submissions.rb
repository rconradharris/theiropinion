class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :url, :null => false
      t.string :title
      t.text :description
      t.string :submitter
      # web, twitter, email
      t.string :method
      # undecided, rejected, approved
      t.string :status, :limit => 16, :null => false
      t.timestamps
    end
    add_index :submissions, :status
  end

  def self.down
    drop_table :submissions
  end
end
