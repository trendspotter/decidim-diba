class SystemStatusesControllerTest < ActionDispatch::IntegrationTest

  test 'show returns an OK' do
    get '/system_status'
    assert_response :success
    assert_equal 'ok', @response.body
  end

end
