require 'test_helper'

class FiledetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filedetail = filedetails(:one)
  end

  test "should get index" do
    get filedetails_url, as: :json
    assert_response :success
  end

  test "should create filedetail" do
    assert_difference('Filedetail.count') do
      post filedetails_url, params: { filedetail: { name: @filedetail.name, owner: @filedetail.owner, path: @filedetail.path, ptype: @filedetail.ptype } }, as: :json
    end

    assert_response 201
  end

  test "should show filedetail" do
    get filedetail_url(@filedetail), as: :json
    assert_response :success
  end

  test "should update filedetail" do
    patch filedetail_url(@filedetail), params: { filedetail: { name: @filedetail.name, owner: @filedetail.owner, path: @filedetail.path, ptype: @filedetail.ptype } }, as: :json
    assert_response 200
  end

  test "should destroy filedetail" do
    assert_difference('Filedetail.count', -1) do
      delete filedetail_url(@filedetail), as: :json
    end

    assert_response 204
  end
end
