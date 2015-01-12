class ShipOrder
  def self.call(order)
    Order.transaction do
      order.status = 'shipped'
      order.save!
    end
  end
end