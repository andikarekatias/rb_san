class CreatePelabuhans < ActiveRecord::Migration[7.0]
  def change
    create_table :pelabuhans do |t|
      t.string :daerah
      t.string :nama_pelabuhan

      t.timestamps
    end
  end
end
