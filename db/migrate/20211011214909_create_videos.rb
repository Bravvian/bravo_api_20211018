class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :synopsis

      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
