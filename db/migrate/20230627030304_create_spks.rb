class CreateSpks < ActiveRecord::Migration[7.0]
  def change
    create_table :spks do |t|
      t.integer :kapal
      t.string :voyage
      t.integer :kegiatan
      t.datetime :est_tiba
      t.datetime :est_berangkat
      t.integer :pelabuhan

      t.timestamps
    end
  end
end
