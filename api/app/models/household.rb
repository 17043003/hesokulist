class Household < ApplicationRecord
    validates :spent_date, presence: true, uniqueness: true
    validates :amount, presence: true, numericality: { only_integer: true }
    validates :memo, length: { maximum: 300 }
end
