require "test_helper"

class SpksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spk = spks(:one)
  end

  test "should get index" do
    get spks_url
    assert_response :success
  end

  test "should get new" do
    get new_spk_url
    assert_response :success
  end

  test "should create spk" do
    assert_difference("Spk.count") do
      post spks_url, params: { spk: { est_berangkat: @spk.est_berangkat, est_tiba: @spk.est_tiba, kapal: @spk.kapal, kegiatan: @spk.kegiatan, pelabuhan: @spk.pelabuhan, voyage: @spk.voyage } }
    end

    assert_redirected_to spk_url(Spk.last)
  end

  test "should show spk" do
    get spk_url(@spk)
    assert_response :success
  end

  test "should get edit" do
    get edit_spk_url(@spk)
    assert_response :success
  end

  test "should update spk" do
    patch spk_url(@spk), params: { spk: { est_berangkat: @spk.est_berangkat, est_tiba: @spk.est_tiba, kapal: @spk.kapal, kegiatan: @spk.kegiatan, pelabuhan: @spk.pelabuhan, voyage: @spk.voyage } }
    assert_redirected_to spk_url(@spk)
  end

  test "should destroy spk" do
    assert_difference("Spk.count", -1) do
      delete spk_url(@spk)
    end

    assert_redirected_to spks_url
  end
end
