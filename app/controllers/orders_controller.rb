class OrdersController < ApplicationController
  YOUR_DOMAIN = ENV.fetch('BASE_URL')


  def create
    chip = Chip.find(params[:chip_id])
    @order = Order.create!(chip: chip, chip_name: chip.name, amount: chip.price, state: 'pending', user: current_user)
    authorize @order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'brl',
          product_data: {
            name: chip.name
          },
          unit_amount: chip.price_cents
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: YOUR_DOMAIN + "/users/#{current_user.id}/wallet",
      cancel_url: YOUR_DOMAIN + "/users/#{current_user.id}/wallet"
    )

    @order.update(checkout_session_id: session.id)
    current_user.wallet.balance += chip.price_cents
    current_user.save
    @wallet = Wallet.find_by(user: current_user)
    balance = @wallet.balance
    @wallet.update(balance: (balance + (chip.price_cents / 100)))
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

end
