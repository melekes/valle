Feature: sets validations
  Background:
    Given I successfully run `bundle exec rails new testapp --skip-bundle --skip-sprockets --skip-javascript`
    And I cd to "testapp"
    And I look for executables in "bin" within the current directory
    And I successfully run `bundle install`
    And I successfully run `rails g model User name:string`
    And I successfully run `rake db:migrate`

  Scenario: Using Valle automatically sets validations
    When I write to "test/unit/user_test.rb" with:
      """
      require 'test_helper'

      class UserTest < ActiveSupport::TestCase
        setup do
          @user = FactoryGirl.create(:user)
        end

        test "should not save user when name is too long" do
          @user.name = 'a' * 256

          assert !@user.save
          assert_equal 1, @user.errors.count
        end
      end
      """
    When I successfully run `rake test`
    Then the output should contain "1 runs, 2 assertions, 0 failures, 0 errors"
