class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id #"Relationship"のactive_relationshipsとは何？Relationshipのforeign_key: :following_idのこと。
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id #"Relationship"のpassive_relationshipsとは何？Relationshipのforeign_key: :follower_idのこと。
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  attachment :profile_image
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  def User.search(search, user_or_book, how_search)
      if user_or_book == "1"
        if how_search == "1"
          User.where(['name LIKE ?', "#{search}"])
        elsif how_search == "2"
          User.where(['name LIKE ?', "#{search}%"])
        elsif how_search == "3"
          User.where(['name LIKE ?', "%#{search}"])
        elsif how_search == "4"
          User.where(['name LIKE ?', "%#{search}%"])
        else
          User.all
        end
      end
  end

end
