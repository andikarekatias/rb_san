require "application_system_test_case"

class SpksTest < ApplicationSystemTestCase
  setup do
    @spk = spks(:one)
  end

  test "visiting the index" do
    visit spks_url
    assert_selector "h1", text: "Spks"
  end

  test "should create spk" do
    visit spks_url
    click_on "New spk"

    fill_in "Est berangkat", with: @spk.est_berangkat
    fill_in "Est tiba", with: @spk.est_tiba
    fill_in "Kapal", with: @spk.kapal
    fill_in "Kegiatan", with: @spk.kegiatan
    fill_in "Pelabuhan", with: @spk.pelabuhan
    fill_in "Voyage", with: @spk.voyage
    click_on "Create Spk"

    assert_text "Spk was successfully created"
    click_on "Back"
  end

  test "should update Spk" do
    visit spk_url(@spk)
    click_on "Edit this spk", match: :first

    fill_in "Est berangkat", with: @spk.est_berangkat
    fill_in "Est tiba", with: @spk.est_tiba
    fill_in "Kapal", with: @spk.kapal
    fill_in "Kegiatan", with: @spk.kegiatan
    fill_in "Pelabuhan", with: @spk.pelabuhan
    fill_in "Voyage", with: @spk.voyage
    click_on "Update Spk"

    assert_text "Spk was successfully updated"
    click_on "Back"
  end

  test "should destroy Spk" do
    visit spk_url(@spk)
    click_on "Destroy this spk", match: :first

    assert_text "Spk was successfully destroyed"
  end
end
