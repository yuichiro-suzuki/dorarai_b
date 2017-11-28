class CreateFirstposts < ActiveRecord::Migration
  def change
    create_table :firstposts do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
