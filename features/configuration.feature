@disable-bundler
Feature:
  In order to temporary disable Valle or apply it only to a subset of models,
  as a user of Rails, I would like to use valle initializer options.

  Background:
    Given I successfully run `bundle exec rails new testapp --skip-bundle --skip-sprockets --skip-javascript`
    And I cd to "testapp"
    And I add "factory_girl_rails" as a dependency
    And I add "valle" from this project as a dependency
    And I successfully run `bundle install`
    And I successfully run `bundle exec rails g model User name:string`
    And I successfully run `bundle exec rake db:migrate -v`

  Scenario: Setting enabled option to false disable Valle
    When I write to "config/initializers/valle.rb" with:
      """
      Valle.configure do |config|
        config.enabled = false
      end
      """
    And I write to "test/unit/user_test.rb" with:
      """
      require 'test_helper'

      class UserTest < ActiveSupport::TestCase
        test "should raise ActiveRecord::StatementInvalid error when name is too long" do
          user = FactoryGirl.create(:user)
          user.name = 'a' * 256

          # SQLLite3 do not throw an ActiveRecord::StatementInvalid error
          # so just check that record gets saved
          assert user.save
        end
      end
      """
    When I successfully run `bundle exec rake test -v`
    Then the output should contain "1 runs, 1 assertions, 0 failures, 0 errors"

  Scenario: Using the exclude_models option should skip the models specified in the list
    When I successfully run `bundle exec rails g model Post title:string`
    And I successfully run `bundle exec rake db:migrate -v`
    And I write to "config/initializers/valle.rb" with:
      """
      Valle.configure do |config|
        config.exclude_models = %w(User)
      end
      """
    And I write to "test/unit/user_test.rb" with:
      """
      require 'test_helper'

      class UserTest < ActiveSupport::TestCase
        test "should raise ActiveRecord::StatementInvalid error when name is too long" do
          user = FactoryGirl.create(:user)
          user.name = 'a' * 256

          # SQLLite3 do not throw an ActiveRecord::StatementInvalid error
          # so just check that record gets saved
          assert user.save
        end
      end
      """
    And I write to "test/unit/post_test.rb" with:
      """
      require 'test_helper'

      class PostTest < ActiveSupport::TestCase
        test "should not save post when title is too long" do
          post = FactoryGirl.create(:post)
          post.title = 'a' * 256

          assert !post.save
          assert_equal 1, post.errors.count
        end
      end
      """
    When I successfully run `bundle exec rake test -v`
    Then the output should contain "2 runs, 3 assertions, 0 failures, 0 errors"

  Scenario: Using exclude_attributes option should allow us to skip some attributes
    When I write to "config/initializers/valle.rb" with:
      """
      Valle.configure do |config|
        config.exclude_attributes = {
          'User' => %w(name)
        }
      end
      """
    And I write to "test/unit/user_test.rb" with:
      """
      require 'test_helper'

      class UserTest < ActiveSupport::TestCase
        test "should raise ActiveRecord::StatementInvalid error when name is too long" do
          user = FactoryGirl.create(:user)
          user.name = 'a' * 256

          # SQLLite3 do not throw an ActiveRecord::StatementInvalid error
          # so just check that record gets saved
          assert user.save
        end
      end
      """
    When I successfully run `bundle exec rake test -v`
    Then the output should contain "1 runs, 1 assertions, 0 failures, 0 errors"
