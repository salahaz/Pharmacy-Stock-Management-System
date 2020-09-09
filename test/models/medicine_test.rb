require 'test_helper'

class MedicineTest < ActiveSupport::TestCase
  
  def setup 
  	@medicine = Medicine.new(name: "example name", barcode: 6118581230970, active_substance: "Active thing", unit_gram: 1, unit: 'G', tva: 0.2)
  end

  test "should be valid" do
  	assert @medicine.valid?
  end

  test "name should be present" do
    @medicine.name = "     "
    assert_not @medicine.valid?
  end

  test "barcode should be present" do
    @medicine.barcode = ""
    assert_not @medicine.valid?
  end

  test "active_substance should be present" do
    @medicine.active_substance = "     "
    assert_not @medicine.valid?
  end

  test "unit_gram should be present" do
    @medicine.unit_gram = ""
    assert_not @medicine.valid?
  end

  test "unit should be present" do
    @medicine.unit = "     "
    assert_not @medicine.valid?
  end

  test "tva should be present" do
    @medicine.tva = ""
    assert_not @medicine.valid?
  end

  test "name should not be too long" do
    @medicine.name = "a" * 50
    assert_not @medicine.valid?
  end

  test "active_substance should not be too long" do
    @medicine.active_substance = "a"*50
    assert_not @medicine.valid?
  end

  test "barcode should be unique" do
    duplicate_medicine = @medicine.dup
    @medicine.save
    assert_not duplicate_medicine.valid?
  end

  test "active_substance should be saved as up-case" do
    mixed_case_active_substance = "ACTive"
    @medicine.active_substance = mixed_case_active_substance 
    @medicine.save
    assert_equal mixed_case_active_substance.upcase, @medicine.reload.active_substance
  end


 
end
