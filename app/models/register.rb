class Register < ApplicationRecord
  def self.search(search)
    if search
      Register.where(['content LIKE ?', "%#{search}"])
    else
      Register.all
    end
  end
end
