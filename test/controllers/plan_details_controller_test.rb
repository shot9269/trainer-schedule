require 'test_helper'

class PlanDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plan_details_new_url
    assert_response :success
  end

  test "should get create" do
    get plan_details_create_url
    assert_response :success
  end

end
