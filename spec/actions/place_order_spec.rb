require 'rails_helper'

RSpec.describe PlaceOrder, :type => :action do
  let(:order) { Order.create(status: 'cart', items_attributes: [{name: "Awesome Product", quantity: 1, price: 1.99}, {name: "Awesome Product 2", quantity: 2, price: 5.99}]) }

  it "should set status to active" do
    expect(order.status).to eq('cart')
    PlaceOrder.call(order)
    expect(order.reload.status).to eq('active')
  end

  it "should set subtotal_amount" do
    expect(order.subtotal_amount).to be_nil
    PlaceOrder.call(order)
    expect(order.reload.subtotal_amount).to eq(13.97)
  end

  it "should set shipping_amount" do
    expect(order.shipping_amount).to be_nil
    PlaceOrder.call(order)
    expect(order.reload.shipping_amount).to eq(9.99)
  end

  it "should set total_amount" do
    expect(order.total_amount).to be_nil
    PlaceOrder.call(order)
    expect(order.reload.total_amount).to eq(23.96)
  end
end
