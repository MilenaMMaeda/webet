# class OrdersController < ApplicationController
#   def create
#     chip = Chip.find(params[:chip_id])
#     @order = Order.create!(chip: chip, chip_name: chip.name, amount: chip.price, state: 'pending', user: current_user)
#     authorize @order
# ...
#     #   success_url: user_wallet_url(user_id: current_user.id),
#     #   cancel_url: user_wallet_url(user_id: current_user.id)
#     # )
#     session = Stripe::Checkout::Session.create(
#       payment_method_types: ['card'],
#       line_items: [{
#         price_data: {
#           currency: 'brl',
#           product_data: {
#             name: chip.name
#           },
#           unit_amount: chip.price_cents
#         },
#         quantity: 1
#       }],
#       mode: 'payment',
#       success_url: user_wallet_url(user_id: current_user.id, amount: chip.price_cents, action: 'update_balance'),
#       cancel_url: user_wallet_url(user_id: current_user.id)
#     )

#     @order.update(checkout_session_id: session.id)
#     redirect_to new_order_payment_path(@order)
#   end
# end

# class OrdersController < ApplicationController
#   def create
#     chip = Chip.find(params[:chip_id])
#     @order = Order.create!(chip: chip, chip_name: chip.name, amount: chip.price, state: 'pending', user: current_user)
#     authorize @order
#     session = Stripe::Checkout::Session.create(
#       payment_method_types: ['card'],
#       line_items: [{
#         price_data: {
#           currency: 'brl',
#           product_data: {
#             name: chip.name
#           },
#           unit_amount: chip.price_cents
#         },
#         quantity: 1
#       }],
#       mode: 'payment',
#       success_url: update_balance_url(user_id: current_user.id),
#       cancel_url: user_wallet_url(user_id: current_user.id)
#     )

#     @order.update(checkout_session_id: session.id)
#     redirect_to new_order_payment_path(@order)
#   end
# end

class OrdersController < ApplicationController
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
      success_url: user_wallet_url(user_id: current_user.id),
      cancel_url: user_wallet_url(user_id: current_user.id)
    )

    @order.update(checkout_session_id: session.id)
    # current_user.wallet.balance += chip.price_cents
    # current_user.save
    @wallet = Wallet.find_by(user: current_user)
    balance = @wallet.balance
    @wallet.update(balance: (balance + (chip.price_cents / 100)))
    redirect_to new_order_payment_path(@order)
  end
end
