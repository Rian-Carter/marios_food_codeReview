class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :origin, :presence => true

  scope :recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.origin, count(reviews.id) as reviews_count")
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

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end