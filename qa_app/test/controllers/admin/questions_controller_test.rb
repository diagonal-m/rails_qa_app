require 'test_helper'

class Admin::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_questions_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_questions_destroy_url
    assert_response :success
  end

end
