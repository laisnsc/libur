class UserBook < ApplicationRecord

  enum book_status: %w(to_read reading read)

  belongs_to :user
  belongs_to :book
  has_many :book_lists

  validates_uniqueness_of :book_id, scope: :user_id

  delegate :author, to: :book
  delegate :title, to: :book

  scope :favorite_books, -> { where(favorite_book: true) }
  scope :favorite_authors, -> { where(favorite_author: true) }
  scope :by_book_status, -> (book_status) { where(book_status: book_status) }
  scope :by_book_id, -> (book_id) { where(book_id: book_id) }

  accepts_nested_attributes_for :book_lists

  TO_READ = 0
  READING = 1
  READ = 2
end