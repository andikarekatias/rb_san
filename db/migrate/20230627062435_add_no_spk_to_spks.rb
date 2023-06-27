class AddNoSpkToSpks < ActiveRecord::Migration[7.0]
  def change
    add_column :spks, :no_spk, :string
    add_index :spks, :no_spk, unique: true
  end
end
