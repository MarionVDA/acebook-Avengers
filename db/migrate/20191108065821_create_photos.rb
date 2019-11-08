# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :caption
      t.integer :user_id
      t.integer :album_id
      t.references :album, foreign_key: true
      t.timestamps
    end
  end
end
