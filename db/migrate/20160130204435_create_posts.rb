class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body, array: true, default: []
      t.attachment :image

      t.timestamps null: false
    end
  end
end
