class Contact < ActiveRecord::Base
  enum role:     [:supplier, :client, :shipper, :all, :other]
  enum priority: [:vip, :important, :ordinary, :bad, :worse, :worst]
end
