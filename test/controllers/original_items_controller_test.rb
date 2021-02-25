require 'test_helper'

class OriginalItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get original_items_index_url
    assert_response :success
  end
end
