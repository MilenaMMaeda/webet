class OrdersController < ApplicationController
  def create
    chip = Chip.find(params[:chip_id])
    order  = Order.create!(chip: chip, chip_name: chip.name, amount: chip.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: chip.name,
        amount: chip.price_cents,
        currency: 'brl',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
