class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album, null: false
      t.string :ttype, null: false
      t.text :lyrics

      t.timestamps
    end
    
    add_index :tracks, :album_id
  end
end
