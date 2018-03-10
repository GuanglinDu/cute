class Admin < ActiveRecord::Base
  enum role: [:nobody, :guest, :operator, :expert, :vip, :root]
  
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  
  def set_default_role
    self.role ||= :nobody
  end
end
