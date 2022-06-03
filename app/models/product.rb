class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :origin, :presence => true

  scope :recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.origin, count(review.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  scope :usa, -> { where(origin: "United States of America") }

  COUNTRY_LIST = [
    "United States of America",
    "Canada",
    "Argentina",
    "China",
    "Mexico",
    "Japan",
    "Korea",
    "Cuba",
    "Finland",
    "Italy",
    "Germany",
    "Philippines",
    "Spain",
    "Turkey"
  ]
end