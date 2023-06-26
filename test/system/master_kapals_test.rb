require "application_system_test_case"

class MasterKapalsTest < ApplicationSystemTestCase
  setup do
    @master_kapal = master_kapals(:one)
  end

  test "visiting the index" do
    visit master_kapals_url
    assert_selector "h1", text: "Master kapals"
  end

  test "should create master kapal" do
    visit master_kapals_url
    click_on "New master kapal"

    fill_in "Alamat owner", with: @master_kapal.alamat_owner
    fill_in "Bendera", with: @master_kapal.bendera
    fill_in "Call sign", with: @master_kapal.call_sign
    fill_in "Draft belakang", with: @master_kapal.draft_belakang
    fill_in "Draft depan", with: @master_kapal.draft_depan
    fill_in "Dwt", with: @master_kapal.dwt
    fill_in "Gt", with: @master_kapal.gt
    fill_in "Hp mesin", with: @master_kapal.hp_mesin
    fill_in "Imo number", with: @master_kapal.imo_number
    fill_in "Jenis kapal", with: @master_kapal.jenis_kapal
    fill_in "Jenis pelayaran", with: @master_kapal.jenis_pelayaran
    fill_in "Loa", with: @master_kapal.loa
    fill_in "Nama kapal", with: @master_kapal.nama_kapal
    fill_in "Pemilik", with: @master_kapal.pemilik
    click_on "Create Master kapal"

    assert_text "Master kapal was successfully created"
    click_on "Back"
  end

  test "should update Master kapal" do
    visit master_kapal_url(@master_kapal)
    click_on "Edit this master kapal", match: :first

    fill_in "Alamat owner", with: @master_kapal.alamat_owner
    fill_in "Bendera", with: @master_kapal.bendera
    fill_in "Call sign", with: @master_kapal.call_sign
    fill_in "Draft belakang", with: @master_kapal.draft_belakang
    fill_in "Draft depan", with: @master_kapal.draft_depan
    fill_in "Dwt", with: @master_kapal.dwt
    fill_in "Gt", with: @master_kapal.gt
    fill_in "Hp mesin", with: @master_kapal.hp_mesin
    fill_in "Imo number", with: @master_kapal.imo_number
    fill_in "Jenis kapal", with: @master_kapal.jenis_kapal
    fill_in "Jenis pelayaran", with: @master_kapal.jenis_pelayaran
    fill_in "Loa", with: @master_kapal.loa
    fill_in "Nama kapal", with: @master_kapal.nama_kapal
    fill_in "Pemilik", with: @master_kapal.pemilik
    click_on "Update Master kapal"

    assert_text "Master kapal was successfully updated"
    click_on "Back"
  end

  test "should destroy Master kapal" do
    visit master_kapal_url(@master_kapal)
    click_on "Destroy this master kapal", match: :first

    assert_text "Master kapal was successfully destroyed"
  end
end
