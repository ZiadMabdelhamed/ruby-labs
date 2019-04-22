require 'test_helper'

class ItemTestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_test = item_tests(:one)
  end

  test "should get index" do
    get item_tests_url, as: :json
    assert_response :success
  end

  test "should create item_test" do
    assert_difference('ItemTest.count') do
      post item_tests_url, params: { item_test: { description: @item_test.description, name: @item_test.name } }, as: :json
    end

    assert_response 201
  end

  test "should show item_test" do
    get item_test_url(@item_test), as: :json
    assert_response :success
  end

  test "should update item_test" do
    patch item_test_url(@item_test), params: { item_test: { description: @item_test.description, name: @item_test.name } }, as: :json
    assert_response 200
  end

  test "should destroy item_test" do
    assert_difference('ItemTest.count', -1) do
      delete item_test_url(@item_test), as: :json
    end

    assert_response 204
  end
end
