require File.dirname(__FILE__) + '/../test_helper'
require 'employees_controller'

# Re-raise errors caught by the controller.
class EmployeesController; def rescue_action(e) raise e end; end

class EmployeesControllerTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :employees

  def setup
    @controller = EmployeesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_allow_signup
    assert_difference 'Employee.count' do
      create_employee
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'Employee.count' do
      create_employee(:login => nil)
      assert assigns(:employee).errors.on(:login)
      assert_response :success
    end
  end

  protected
    def create_employee(options = {})
      post :create, :employee => { :login => 'quire' }.merge(options)
    end
end
