class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  before_validation :remove_deplicate_spaces

  def remove_deplicate_spaces
    self.title.to_s.squish!
    self.description.to_s.squish!
  end

  # create update (save) delete
end