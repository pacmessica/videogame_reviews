class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :conent
      t.references :user, index: true, foreign_key: true
      t.references :games, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
