class User < ApplicationRecord

    attr_writer :login

    has_one_attached :avatar
    has_many :lists, dependent: :destroy
    has_many :book_lists, through: :lists
    has_many :user_books
    has_many :books, through: :user_books
    has_many :user_tags
    has_many :tags, through: :user_tags

    accepts_nested_attributes_for :lists, allow_destroy: true
    accepts_nested_attributes_for :book_lists, allow_destroy: true
    accepts_nested_attributes_for :user_books, allow_destroy: true

    validates :name, :email, presence: true
    validates :login_name, presence: true, uniqueness: { case_sensitive: false }
    validates_format_of :login_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

    def login
        @login || self.login_name || self.email
    end

    def recent_lists
        lists.last(3)
    end

    def favorite_books
        user_books.favorite_books.map(&:book)
    end

    def favorite_authors
        user_books.favorite_authors.map(&:book).map(&:author)
    end
end
