class User < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  # https://qiita.com/shunhikita/items/772b81a1cc066e67930e 参照
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }}
  validates :friend_id, {presence: true, uniqueness: true}


  def self.search(search)
    if search
      User.where(['friend_id LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
end
