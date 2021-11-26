require 'test_helper'

class ArticleAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article_attribute = article_attributes(:one)
  end

  test "should get index" do
    get article_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_article_attribute_url
    assert_response :success
  end

  test "should create article_attribute" do
    assert_difference('ArticleAttribute.count') do
      post article_attributes_url, params: { article_attribute: { references: @article_attribute.references, value: @article_attribute.value } }
    end

    assert_redirected_to article_attribute_url(ArticleAttribute.last)
  end

  test "should show article_attribute" do
    get article_attribute_url(@article_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_attribute_url(@article_attribute)
    assert_response :success
  end

  test "should update article_attribute" do
    patch article_attribute_url(@article_attribute), params: { article_attribute: { references: @article_attribute.references, value: @article_attribute.value } }
    assert_redirected_to article_attribute_url(@article_attribute)
  end

  test "should destroy article_attribute" do
    assert_difference('ArticleAttribute.count', -1) do
      delete article_attribute_url(@article_attribute)
    end

    assert_redirected_to article_attributes_url
  end
end
