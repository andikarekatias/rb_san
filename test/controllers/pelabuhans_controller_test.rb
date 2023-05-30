require "test_helper"

class PelabuhansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pelabuhan = pelabuhans(:one)
  end

  test "should get index" do
    get pelabuhans_url
    assert_response :success
  end

  test "should get new" do
    get new_pelabuhan_url
    assert_response :success
  end

  test "should create pelabuhan" do
    assert_difference("Pelabuhan.count") do
      post pelabuhans_url, params: { pelabuhan: { daerah: @pelabuhan.daerah, nama_pelabuhan: @pelabuhan.nama_pelabuhan } }
    end

    assert_redirected_to pelabuhan_url(Pelabuhan.last)
  end

  test "should show pelabuhan" do
    get pelabuhan_url(@pelabuhan)
    assert_response :success
  end

  test "should get edit" do
    get edit_pelabuhan_url(@pelabuhan)
    assert_response :success
  end

  test "should update pelabuhan" do
    patch pelabuhan_url(@pelabuhan), params: { pelabuhan: { daerah: @pelabuhan.daerah, nama_pelabuhan: @pelabuhan.nama_pelabuhan } }
    assert_redirected_to pelabuhan_url(@pelabuhan)
  end

  test "should destroy pelabuhan" do
    assert_difference("Pelabuhan.count", -1) do
      delete pelabuhan_url(@pelabuhan)
    end

    assert_redirected_to pelabuhans_url
  end
end
