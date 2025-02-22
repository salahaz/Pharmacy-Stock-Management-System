require 'test_helper'

class BlTest < ActiveSupport::TestCase
  def setup 
  	@bl = Bl.new(provider_id: 12, order_id: 874587487, user_id: 3, finalpph: 120.3)
  end

  test "should be valid " do
  	assert @bl.valid?
  end

  test "provider_id should be present" do
  	@bl.provider_id = "        "
  	assert_not @bl.valid?
  end

  test "order_id should be present" do
  	@bl.order_id = ""
  	assert_not @bl.valid?
  end

  test "user_id should be present" do
  	@bl.user_id = ""
  	assert_not @bl.valid?
  end

  test "finalpph should be present" do
  	@bl.finalpph = ""
  	assert_not @bl.valid?
  end

 
  test "order_id should be unique" do
  	duplicate_bl = @bl.dup
    @bl.save
    assert_not duplicate_bl.valid?
  end


end
