class Classlist < ApplicationRecord

  def self.search(search)
    if search
      Classlist.where(['department LIKE ?', "%#{search}%"])
    else
      Classlist.all
    end
  end
end
