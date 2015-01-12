class PlaceOrder
  def self.call(order)
    Order.transaction do
      order.subtotal_amount = order.items.inject(0) {|sum, oi| sum += oi.quantity * oi.price }
      
      order.shipping_amount = 9.99 # flat rate shipping for everyone!
      
      order.total_amount = order.subtotal_amount + order.shipping_amount
      
      order.status = 'active'
      
      order.save!
    end
  end
end