class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  belongs_to :user

  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def japan
    japan_number = "+81 #{phone_number}"
  end

end
