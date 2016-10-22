require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get bienvenido" do
    get landing_bienvenido_url
    assert_response :success
  end

  test "should get adios" do
    get landing_adios_url
    assert_response :success
  end

end
