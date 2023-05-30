require "application_system_test_case"

class PengumumenTest < ApplicationSystemTestCase
  setup do
    @pengumuman = pengumumen(:one)
  end

  test "visiting the index" do
    visit pengumumen_url
    assert_selector "h1", text: "Pengumumen"
  end

  test "should create pengumuman" do
    visit pengumumen_url
    click_on "New pengumuman"

    fill_in "Body", with: @pengumuman.body
    fill_in "Title", with: @pengumuman.title
    fill_in "User", with: @pengumuman.user_id
    click_on "Create Pengumuman"

    assert_text "Pengumuman was successfully created"
    click_on "Back"
  end

  test "should update Pengumuman" do
    visit pengumuman_url(@pengumuman)
    click_on "Edit this pengumuman", match: :first

    fill_in "Body", with: @pengumuman.body
    fill_in "Title", with: @pengumuman.title
    fill_in "User", with: @pengumuman.user_id
    click_on "Update Pengumuman"

    assert_text "Pengumuman was successfully updated"
    click_on "Back"
  end

  test "should destroy Pengumuman" do
    visit pengumuman_url(@pengumuman)
    click_on "Destroy this pengumuman", match: :first

    assert_text "Pengumuman was successfully destroyed"
  end
end
