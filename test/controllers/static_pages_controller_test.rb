require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "Ragavendra"
		@title_prefix = ""
	end

  test "should get home" do
    get static_pages_home_url
    assert_select "title", @base_title
    assert_response :success
		#after_test
  end

  test "should get help" do
    get static_pages_help_url
		@title_prefix = "Help"
		after_test
  end
  
  test "should get about" do
    get static_pages_about_url
		@title_prefix = "About"
		after_test
  end

  test "should get blog" do
    get static_pages_blog_url
		@title_prefix = "Blog"
		after_test
  end

	def after_test
    assert_response :success
    assert_select "title", "#{@title_prefix} | #{@base_title}"
		#assert_select "h3".include?, @title_prefix
	end

end
