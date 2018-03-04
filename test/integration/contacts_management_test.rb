require 'test_helper'

class ContactsManagementTest < ActionDispatch::IntegrationTest
  test "invalid contact creation" do
    get new_contact_path
    assert_no_difference 'Contact.count' do
      post contacts_path, contact: { name: "", mobile: "123456789" }
    end
    assert_template 'contacts/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid contact creation" do
    get new_contact_path
    assert_difference 'Contact.count', 1 do
      post_via_redirect contacts_path, contact: { name: "test02",
                        mobile: "123456789", email: "test02@example.com" }
    end
    assert_template 'contacts/index'
    assert_not flash.empty?
  end
end
