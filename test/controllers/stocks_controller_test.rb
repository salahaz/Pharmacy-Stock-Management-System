require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_stock_path
    assert_response :success
  end

end
