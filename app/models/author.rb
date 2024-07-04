class Author < ApplicationRecord

  before_validation :transliterate_name

  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validate :unique_name_registered

  accepts_nested_attributes_for :books, allow_destroy: true

  scope :by_transliterated_name, -> (name) do
    where(transliterated_name: I18n.transliterate(name))
  end

  def unique_name_registered
    authors = Author.by_transliterated_name(name)
    errors.add(:base, :existent) if authors.any?
  end

  def transliterate_name
    self.transliterated_name ||= I18n.transliterate(name)
  end
end