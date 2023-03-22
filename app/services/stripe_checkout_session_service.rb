# class StripeCheckoutSessionService
#   def call(event)
#     order = Order.find_by(checkout_session_id: event.data.object.id)
#     order.update(state: 'paid')
#     # @wallet = Wallet.find_by(user: current_user)
#     # balance = @wallet.balance
#     # @wallet.update(balance: (balance + (chip.price_cents / 100)))
#   end
# end


# descomentar o stripe.rb de initializar pra fazer a mudança aqui, mas só rola depois q estiver tudo configurado
