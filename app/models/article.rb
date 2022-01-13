class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  before_validation :remove_duplicate_spaces

  before_save :update_search_field

  before_destroy :nope

  def remove_duplicate_spaces
    self.title.to_s.squish!
    self.description.to_s.squish!
  end

  def update_search_field
    self.search = self.title.to_s.downcase + " " + self.description.to_s.downcase
  end

  def nope
    raise "ERROR! This object can't be destroyed"
  end

  # create update (save) delete
end