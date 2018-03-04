require 'test_helper'

class ContactsEditTest < ActionDispatch::IntegrationTest
  def setup
    @contact = contacts(:michael)
  end

  test "unsuccessful edit" do
    get edit_contact_path(@contact)
    assert_template 'contacts/edit'
    patch contact_path(@contact), contact: { name: "",
                                             mobile: "139123456780" }
    assert_template 'contacts/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "successful edit" do
    get edit_contact_path(@contact)
    assert_template 'contacts/edit'
    name   = "Foo Bar"
    mobile = "139123456781"
    patch contact_path(@contact), contact: { name:   name,
                                             mobile: mobile }
    assert_not flash.empty?
    assert_redirected_to @contact
    @contact.reload
    assert_equal name,   @contact.name
    assert_equal mobile, @contact.mobile
  end
end
