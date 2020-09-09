require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup 
    @base_title = "Errachidia Pharmacy"
  end

  test "should get overview" do
    get overview_path
    assert_response :success
    assert_select "title", "Overview | #{@base_title}"
  end

  test "should get inventory" do
    get inventory_path
    assert_response :success
    assert_select "title", "Inventory | #{@base_title}"
  end

  test "should get orderhistory" do
    get orderhistory_path
    assert_response :success
    assert_select "title", "Order History | #{@base_title}"
  end

  test "should get finances" do
    get finances_path
    assert_response :success
    assert_select "title", "Finances | #{@base_title}"
  end


  test "should get providers" do
    get providers_path
    assert_response :success
    assert_select "title", "Providers | #{@base_title}"
  end

end
