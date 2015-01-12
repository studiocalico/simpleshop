class Order < ActiveRecord::Base
  belongs_to :user

  has_many :items, class_name: 'Order::Item', dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  validates :status, inclusion: { in: ['cart','active','shipped'] }
end
