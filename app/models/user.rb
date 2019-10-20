class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  def admin?
   is_admin
 end

   has_many :favorites
   has_many :favorite_posts, :through => :favorites, :source => :post

   def is_fan_of?(group)
     favorite_posts.include?(group)
   end

   has_many :comments

end
