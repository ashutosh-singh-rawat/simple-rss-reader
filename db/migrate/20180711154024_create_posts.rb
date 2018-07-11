class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.text :content
      t.string :url
      t.references :feed

      t.timestamps
    end
  end
end
