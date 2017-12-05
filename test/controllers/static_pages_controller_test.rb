require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "Ragavendra"
		@title_prefix = ""
	end

  test "should get home" do
    get root_path 
    assert_select "title", @base_title
    assert_response :success
		#after_test
  end

  test "should get help" do
    get help_path 
		@title_prefix = "Help"
		after_test
  end
  
  test "should get about" do
    get about_path 
		@title_prefix = "About"
		after_test
  end

  test "should get blog" do
    get blog_path 
		@title_prefix = "Blog"
		after_test
  end

  test "should get contact" do
    get contact_path 
		@title_prefix = "Contact"
		after_test
  end

=begin
  test "should get login" do
    get login_path 
		@title_prefix = "Login"
		after_test
  end
=end

	def after_test
    assert_response :success
    assert_select "title", "#{@title_prefix} | #{@base_title}"
	end

end
