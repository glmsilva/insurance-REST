require "test_helper"

class PoliciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policy = policies(:one)
  end

  test "should get index" do
    get policies_url, as: :json
    assert_response :success
  end

  test "should create policy" do
    assert_difference("Policy.count") do
      post policies_url, params: { policy: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show policy" do
    get policy_url(@policy), as: :json
    assert_response :success
  end

  test "should update policy" do
    patch policy_url(@policy), params: { policy: {  } }, as: :json
    assert_response :success
  end

  test "should destroy policy" do
    assert_difference("Policy.count", -1) do
      delete policy_url(@policy), as: :json
    end

    assert_response :no_content
  end
end
