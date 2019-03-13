class Task < ApplicationRecord
  validates :title, {presence: true}
  validates :title, uniqueness: true
  validates :memo, {presence: true, length: {in: 10..30}}
  enum status: [:draft, :published, :archieved]
end
