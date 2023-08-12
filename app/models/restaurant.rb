class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
class Restaurant < ApplicationRecord
  has_many :review

  validates :content, presence: true
end
