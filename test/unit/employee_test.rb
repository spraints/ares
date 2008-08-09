require File.dirname(__FILE__) + '/../test_helper'

class EmployeeTest < Test::Unit::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :employees

  def test_should_create_employee
    assert_difference 'Employee.count' do
      employee = create_employee
      assert !employee.new_record?, "#{employee.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'Employee.count' do
      u = create_employee(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_authenticate_employee
    # TODO -- should use AD for authentication instead of password-less logins
    assert_equal employees(:quentin), Employee.authenticate('quentin', 'TODO -- Use AD')
  end

  def test_should_set_remember_token
    employees(:quentin).remember_me
    assert_not_nil employees(:quentin).remember_token
    assert_not_nil employees(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    employees(:quentin).remember_me
    assert_not_nil employees(:quentin).remember_token
    employees(:quentin).forget_me
    assert_nil employees(:quentin).remember_token
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    employees(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil employees(:quentin).remember_token
    assert_not_nil employees(:quentin).remember_token_expires_at
    assert employees(:quentin).remember_token_expires_at.between?(before, after)
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    employees(:quentin).remember_me_until time
    assert_not_nil employees(:quentin).remember_token
    assert_not_nil employees(:quentin).remember_token_expires_at
    assert_equal employees(:quentin).remember_token_expires_at, time
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    employees(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil employees(:quentin).remember_token
    assert_not_nil employees(:quentin).remember_token_expires_at
    assert employees(:quentin).remember_token_expires_at.between?(before, after)
  end

protected
  def create_employee(options = {})
    record = Employee.new({ :login => 'quire', }.merge(options))
    record.save
    record
  end
end
