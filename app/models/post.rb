class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  belongs_to :category

  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user
  has_many :comments
end
