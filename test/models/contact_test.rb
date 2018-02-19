require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = Contact.new(name: "Barack Obama", mobile: 139123456789,
                           role: 1, priority: 1, address: "Santa county")
  end

  test "should be valid" do
    assert @contact.valid?
  end
end
