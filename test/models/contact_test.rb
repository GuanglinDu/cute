require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact = Contact.new(name: "Barack Obama",
                           mobile: "139123456789",
                           role: 1,
                           priority: 1,
                           address: "Santa county",
                           email: "exampe@example.com")
  end

  test "should be valid" do
    assert @contact.valid?
  end

  test "name should be present" do
    @contact.name = "  "
    assert_not @contact.valid?
  end
  
  test "name should be unique" do
    duplicate_contact = @contact.dup
    duplicate_contact.name = @contact.name.upcase
    @contact.save
    assert_not duplicate_contact.valid?
  end

  test "name should not be over 60 chars long" do
    @contact.name = "a" * 61
    assert_not @contact.valid?
  end

  test "mobile number should not be over 20 digits long" do
    @contact.mobile = "86-13912345678"
    assert @contact.valid?

    @contact.mobile = "123456" * 4 
    assert_not @contact.valid?
  end

  test "phone number should not be over 20 chars long" do
    @contact.phone = "86-10-22228888"
    assert @contact.valid?

    @contact.phone = "22228888" * 3
    assert_not @contact.valid?
  end

  test "address should not be over 255 chars long" do
    @contact.address = "a" * 100
    assert @contact.valid?

    @contact.address = "abc" * 100
    assert_not @contact.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @contact.email = valid_address
      assert @contact.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      assert_not @contact.valid?,
                 "#{invalid_address.inspect} should be invalid"
    end
  end  
end
