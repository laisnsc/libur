class Book < ApplicationRecord

  belongs_to :author
  belongs_to :genre
  has_many :book_editions, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :genre_id, presence: true
end