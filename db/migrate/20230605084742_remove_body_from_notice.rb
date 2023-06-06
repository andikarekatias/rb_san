class RemoveBodyFromNotice < ActiveRecord::Migration[7.0]
  def change
    remove_column :notices, :body, :text
  end
end
