require "application_system_test_case"

class PelabuhansTest < ApplicationSystemTestCase
  setup do
    @pelabuhan = pelabuhans(:one)
  end

  test "visiting the index" do
    visit pelabuhans_url
    assert_selector "h1", text: "Pelabuhans"
  end

  test "should create pelabuhan" do
    visit pelabuhans_url
    click_on "New pelabuhan"

    fill_in "Daerah", with: @pelabuhan.daerah
    fill_in "Nama pelabuhan", with: @pelabuhan.nama_pelabuhan
    click_on "Create Pelabuhan"

    assert_text "Pelabuhan was successfully created"
    click_on "Back"
  end

  test "should update Pelabuhan" do
    visit pelabuhan_url(@pelabuhan)
    click_on "Edit this pelabuhan", match: :first

    fill_in "Daerah", with: @pelabuhan.daerah
    fill_in "Nama pelabuhan", with: @pelabuhan.nama_pelabuhan
    click_on "Update Pelabuhan"

    assert_text "Pelabuhan was successfully updated"
    click_on "Back"
  end

  test "should destroy Pelabuhan" do
    visit pelabuhan_url(@pelabuhan)
    click_on "Destroy this pelabuhan", match: :first

    assert_text "Pelabuhan was successfully destroyed"
  end
end
