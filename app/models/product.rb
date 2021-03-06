class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0.0 }
  validates :category, presence: true
  
  has_one_attached :photo

  def to_param
    "#{id}-#{name}".parameterize
end
end
