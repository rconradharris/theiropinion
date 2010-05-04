class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :url, :null => false
      t.string :title, :null => false
      t.text :description
      t.string :author
      t.string :source
      t.date :publication_date
      # unposted, hidden, posted
      t.string :status, :limit => 16, :null => false
      t.integer :submission_id
      t.timestamps
    end
    add_index :articles, :submission_id
    add_index :articles, :status
  end

  def self.down
    drop_table :articles
  end
end
