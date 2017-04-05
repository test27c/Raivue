require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "kanji")
  end

  test "should get categories index" do
    get '/categories/index'
    assert_response :success
  end

  test "should get new" do
    get '/categories/new'
    assert_response :success
  end

  test "should get show" do
    get('/categories/show', { 'id' => @category.id })
    assert_response :success
  end

end
