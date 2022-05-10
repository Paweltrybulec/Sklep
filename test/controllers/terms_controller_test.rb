require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy" do
    get terms_privacy_url
    assert_response :success
  end

  test "should get shipping" do
    get terms_shipping_url
    assert_response :success
  end

  test "should get about" do
    get terms_about_url
    assert_response :success
  end

end
