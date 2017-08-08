require 'test_helper'

class DirdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dirdetail = dirdetails(:one)
  end

  test "should get index" do
    get dirdetails_url, as: :json
    assert_response :success
  end

  test "should create dirdetail" do
    assert_difference('Dirdetail.count') do
      post dirdetails_url, params: { dirdetail: { name: @dirdetail.name, owner: @dirdetail.owner, path: @dirdetail.path, ptype: @dirdetail.ptype } }, as: :json
    end

    assert_response 201
  end

  test "should show dirdetail" do
    get dirdetail_url(@dirdetail), as: :json
    assert_response :success
  end

  test "should update dirdetail" do
    patch dirdetail_url(@dirdetail), params: { dirdetail: { name: @dirdetail.name, owner: @dirdetail.owner, path: @dirdetail.path, ptype: @dirdetail.ptype } }, as: :json
    assert_response 200
  end

  test "should destroy dirdetail" do
    assert_difference('Dirdetail.count', -1) do
      delete dirdetail_url(@dirdetail), as: :json
    end

    assert_response 204
  end
end
