require 'test_helper'

class ContactsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @contact = contacts(:michael)
  end

  test "index including pagination" do
    get contacts_path
    assert_template 'contacts/index'
    assert_select 'div.pagination'
    Contact.paginate(page: 1).each do |contact|
      assert_select 'a[href=?]', edit_contact_path(contact), text: 'Edit'
    end
  end
end
