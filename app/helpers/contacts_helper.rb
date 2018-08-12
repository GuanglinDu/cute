module ContactsHelper
  def find_all_suppliers()
  	Contact.where(role: "supplier")
  	# Contact.where(role: 0) # OK
  	# Contact.where(role: :supplier) # returns empty []
  end
end
