class Order::Item < ActiveRecord::Base
  belongs_to :order
  validates :order, presence: true
end
