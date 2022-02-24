class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # before_destroy :prevent_destroy
  # attr_accessor :destroyed_by_parent

  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }

  # private

  # def prevent_destroy
  #   if !destroyed_by_parent
  #     self.errors[:base] << "You may not delete this child."
  #     return false
  #   end
  # end
end
