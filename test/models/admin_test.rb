require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "default rols is nobody" do
    admin = Admin.new
    assert_equal "nobody", admin.role, "should be nobody"
  end
end
