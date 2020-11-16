class Product < ApplicationRecord
    belongs_to :user
    has_many :carts
    has_many :buyers, through: :carts
    
    has_many :favourites
    has_many :buyers, through: :favourites

    has_many :attachments, as: :attached_item, dependent: :destroy
    accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: proc { |attributes| attributes[:attachment].nil? }
    
    scope :approve, -> { where(status: "approve") }
    scope :disapprove, -> { where(status: "disapprove") }
end
