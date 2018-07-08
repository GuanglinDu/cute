require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:david)
  end

  test "should get index" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application", partial: "_row"    
    assert_response :success
    assert_not_nil assigns(:admins)
    assert_select "title", "All Admins | Cute"
  end
  
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  test "should update admin" do
    patch :update, id: @admin, admin: { role: "operator" }
    assert_redirected_to admins_path
    #assert_select 'h3', 'Listing Admins' # move to integration tests?
    assert_not flash.empty?
    assert_equal flash[:success], 'Admin was successfully updated!'
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end
    assert_redirected_to admins_url
    assert_not flash.empty?
    assert_equal flash[:success], 'Admin was successfully destroyed!'
  end
end
