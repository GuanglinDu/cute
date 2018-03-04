class Contact < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum role:     [:supplier, :client, :shipper, :all_above, :other]
  enum priority: [:vip, :important, :ordinary, :bad, :worse, :worst]
  
  before_save { self.email = email.downcase }

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 60 }
  validates :mobile, allow_nil: true,
                     allow_blank: true,
                     length: { maximum: 20 }
  validates :phone, allow_nil: true,
                    allow_blank: true,
                    length: { maximum: 30 }
  validates :address, allow_nil: true,
                      allow_blank: true,
                      length: { maximum: 255 }
  validates :email, allow_nil: true,
                    allow_blank: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    case_sensitive: false
end
