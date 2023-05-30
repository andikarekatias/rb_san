class AddUserToPelabuhans < ActiveRecord::Migration[7.0]
  def change
    add_reference :pelabuhans, :user, null: false, foreign_key: true
  end
end
