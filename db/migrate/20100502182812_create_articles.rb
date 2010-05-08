class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :url, :null => false
      t.string :title, :null => false
      t.text :description
      t.string :author
      t.string :source
      t.date :publication_date
      t.boolean :is_posted, :null => false, :default => false
      t.integer :submission_id
      t.timestamps
    end
    add_index :articles, :submission_id
    add_index :articles, :is_posted
  end

  def self.down
    drop_table :articles
  end
end
