class List < ApplicationRecord

  belongs_to :user
  has_many :book_lists, dependent: :destroy
  has_many :books, -> {distinct}, through: :book_lists
  has_many :user_books, -> {distinct}, through: :book_lists

  accepts_nested_attributes_for :user_books
  accepts_nested_attributes_for :book_lists, allow_destroy: true
end