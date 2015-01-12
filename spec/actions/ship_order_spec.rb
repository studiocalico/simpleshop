require 'rails_helper'

RSpec.describe ShipOrder, :type => :action do
  let(:order) { Order.create(status: 'active', subtotal_amount: 13.97, shipping_amount: 9.99, total_amount: 23.96, items_attributes: [{name: "Awesome Product", quantity: 1, price: 1.99}, {name: "Awesome Product 2", quantity: 2, price: 5.99}]) }

  it "should set status to shipped" do
    expect(order.status).to eq('active')
    ShipOrder.call(order)
    expect(order.reload.status).to eq('shipped')
  end
end
