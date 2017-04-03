require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article= Article.new(title: "This is test article", description: "This is test article description")
  end
  
  test "Title should be present" do
    @article.title = nil
    assert_not @article.valid?
  end

  test "Description should be present" do
    @article.description = nil
    assert_not @article.valid?
  end

  test "Title should be more than 3 characters" do
    @article.title = "a"
    assert_not @article.valid?
  end

  test "Title should be less than 50 characters" do
    @article.title = "a" * 51
    assert_not @article.valid?
  end

  test "Description should be more than 10 characters" do
    @article.description = "a"
    assert_not @article.valid?
  end

  test "Description should be less than 300 characters" do
    @article.description = "a" * 301
    assert_not @article.valid?
  end

end
