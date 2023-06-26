require "test_helper"

class MasterKapalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_kapal = master_kapals(:one)
  end

  test "should get index" do
    get master_kapals_url
    assert_response :success
  end

  test "should get new" do
    get new_master_kapal_url
    assert_response :success
  end

  test "should create master_kapal" do
    assert_difference("MasterKapal.count") do
      post master_kapals_url, params: { master_kapal: { alamat_owner: @master_kapal.alamat_owner, bendera: @master_kapal.bendera, call_sign: @master_kapal.call_sign, draft_belakang: @master_kapal.draft_belakang, draft_depan: @master_kapal.draft_depan, dwt: @master_kapal.dwt, gt: @master_kapal.gt, hp_mesin: @master_kapal.hp_mesin, imo_number: @master_kapal.imo_number, jenis_kapal: @master_kapal.jenis_kapal, jenis_pelayaran: @master_kapal.jenis_pelayaran, loa: @master_kapal.loa, nama_kapal: @master_kapal.nama_kapal, pemilik: @master_kapal.pemilik } }
    end

    assert_redirected_to master_kapal_url(MasterKapal.last)
  end

  test "should show master_kapal" do
    get master_kapal_url(@master_kapal)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_kapal_url(@master_kapal)
    assert_response :success
  end

  test "should update master_kapal" do
    patch master_kapal_url(@master_kapal), params: { master_kapal: { alamat_owner: @master_kapal.alamat_owner, bendera: @master_kapal.bendera, call_sign: @master_kapal.call_sign, draft_belakang: @master_kapal.draft_belakang, draft_depan: @master_kapal.draft_depan, dwt: @master_kapal.dwt, gt: @master_kapal.gt, hp_mesin: @master_kapal.hp_mesin, imo_number: @master_kapal.imo_number, jenis_kapal: @master_kapal.jenis_kapal, jenis_pelayaran: @master_kapal.jenis_pelayaran, loa: @master_kapal.loa, nama_kapal: @master_kapal.nama_kapal, pemilik: @master_kapal.pemilik } }
    assert_redirected_to master_kapal_url(@master_kapal)
  end

  test "should destroy master_kapal" do
    assert_difference("MasterKapal.count", -1) do
      delete master_kapal_url(@master_kapal)
    end

    assert_redirected_to master_kapals_url
  end
end
