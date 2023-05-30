require "test_helper"

class PengumumenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pengumuman = pengumumen(:one)
  end

  test "should get index" do
    get pengumumen_url
    assert_response :success
  end

  test "should get new" do
    get new_pengumuman_url
    assert_response :success
  end

  test "should create pengumuman" do
    assert_difference("Pengumuman.count") do
      post pengumumen_url, params: { pengumuman: { body: @pengumuman.body, title: @pengumuman.title, user_id: @pengumuman.user_id } }
    end

    assert_redirected_to pengumuman_url(Pengumuman.last)
  end

  test "should show pengumuman" do
    get pengumuman_url(@pengumuman)
    assert_response :success
  end

  test "should get edit" do
    get edit_pengumuman_url(@pengumuman)
    assert_response :success
  end

  test "should update pengumuman" do
    patch pengumuman_url(@pengumuman), params: { pengumuman: { body: @pengumuman.body, title: @pengumuman.title, user_id: @pengumuman.user_id } }
    assert_redirected_to pengumuman_url(@pengumuman)
  end

  test "should destroy pengumuman" do
    assert_difference("Pengumuman.count", -1) do
      delete pengumuman_url(@pengumuman)
    end

    assert_redirected_to pengumumen_url
  end
end
