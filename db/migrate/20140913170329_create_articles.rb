class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :type
      t.text :body
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
