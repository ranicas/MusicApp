class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :band, null: false
      t.string :ttype

      t.timestamps
    end
    
    add_index :albums, :band_id
  end
end
