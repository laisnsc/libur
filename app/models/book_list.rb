class BookList < ApplicationRecord

  belongs_to :book
  belongs_to :user_book
  belongs_to :list

  # delegate :user, to: :list
  # delegate :author, to: :book
  # delegate :title, to: :book

  validates_uniqueness_of :book_id, :scope => :list_id
  accepts_nested_attributes_for :user_book

  # suspicious...
  def get_user_book
    user.user_books.by_book_id(book_id).first
  end
end