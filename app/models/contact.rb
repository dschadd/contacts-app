class Contact < ApplicationRecord
  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = first_name + " " + last_name
    return full_name
  end

  def japan
    japan_number = "+81 " + phone_number
  end

end
