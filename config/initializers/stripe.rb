# require 'config/initializers/stripe'

Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

# class StripeCheckoutSessionService
#   def call(event)
#     order = Order.find_by(checkout_session_id: event.data.object.id)
#     order.update(state: 'paid')
#     # @wallet = Wallet.find_by(user: current_user)
#     # balance = @wallet.balance
#     # @wallet.update(balance: (balance + (chip.price_cents / 100)))
#   end
# end


# StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET']

# StripeEvent.configure do |events|
#   events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
# end
