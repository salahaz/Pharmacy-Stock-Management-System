require 'test_helper'

class BlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_bl_path
    assert_response :success
  end

end
