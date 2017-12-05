require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Sample user", email: "sample@adomain.com", 
										 password: "Pa55w)rd", password_confirmation: "Pa55w)rd")
	end

	test "should be valid user" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "    "
		assert_not @user.valid?
	end
	
	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end
	
	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "valid email addresses should be accepted" do
		valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foobar.org first.last@foo.jp alixe+bob@baz.cn]
		valid_addresses.each do | valid_address |
			@user.email = valid_address
			assert @user.valid?, "#{@user.email} should be valid #{@user.errors.messages}"
		end
	end

	test "invalid email addresses should be rejected" do
		valid_addresses = %w[user@exampl,com USERfoo.com A_US-ER@foo.ba@bar.org alixe+bob@baz+bar.com foo@bar..com first.last@foo.jpalixe+bob@baz.cn]
		valid_addresses.each do | valid_address |
			@user.email = valid_address
			assert_not @user.valid?, "#{@user.email} is being accepted"
		end
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid? , "User duplicate saved"
	end

	test "duplicate email addresses case check" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid? , "User duplicate saved #{duplicate_user.email.inspect}"
	end

	test "email addresses should be saved as lower-case" do
		mixed_case_email = "Foo@ExAMPle.CoM"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	test "password should be present (nonblank)" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end

	test "password should have a minimum length" do
		@user.password = @user.password_confirmation = "a" * 5
		assert_not @user.valid?
	end

end
