class CreateFreeposts < ActiveRecord::Migration
  def change
    create_table :freeposts do |t|
      t.text :content

      t.timestamps null: false
      #t.index [ :created_at]
    end
  end
end
