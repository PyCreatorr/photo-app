require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    #assert true
    # binding.irb
    #assert blog_posts(published_at:nil).draft?
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for published blog post" do
    #assert true
    # binding.irb
    refute blog_posts(:published).draft? # return false
  end

  test "draft? returns false for scheduled blog post" do
    #assert true
    # binding.irb
    refute blog_posts(:scheduled).draft? # return false
  end

  test "published? returns true for published blog post" do
    # binding.irb
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog post" do
    # binding.irb
    refute blog_posts(:draft).published? # return false
  end

  test "published? returns false for scheduled blog post" do
    # binding.irb
    refute blog_posts(:scheduled).published? # return false
  end

  test "scheduled? returns true for scheduled blog post" do
    # binding.irb
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    # binding.irb
    refute blog_posts(:draft).scheduled? # return false
  end

  test "scheduled? returns false for published blog post" do
    # binding.irb
    refute blog_posts(:published).scheduled? # return false
  end

  # def draft_blog_post
  # end
end
