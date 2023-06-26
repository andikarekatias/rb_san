class CreateMasterKapals < ActiveRecord::Migration[7.0]
  def change
    create_table :master_kapals do |t|
      t.string :nama_kapal
      t.string :bendera
      t.string :pemilik
      t.string :alamat_owner
      t.string :jenis_pelayaran
      t.integer :jenis_kapal
      t.integer :imo_number
      t.string :call_sign
      t.integer :dwt
      t.integer :gt
      t.integer :loa
      t.integer :draft_depan
      t.integer :draft_belakang
      t.integer :hp_mesin

      t.timestamps
    end
  end
end
