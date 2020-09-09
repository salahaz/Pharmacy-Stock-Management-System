require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sales_new_url
    assert_response :success
  end

  test "should get update" do
    get sales_update_url
    assert_response :success
  end

  test "should get index" do
    get sales_index_url
    assert_response :success
  end

end
