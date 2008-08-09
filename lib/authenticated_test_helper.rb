module AuthenticatedTestHelper
  # Sets the current employee in the session from the employee fixtures.
  def login_as(employee)
    @request.session[:employee_id] = employee ? employees(employee).id : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
