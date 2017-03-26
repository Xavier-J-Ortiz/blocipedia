 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['sk_test_cJHafaYPvCiKd4r8PLu9uXru'],
   secret_key: ENV['pk_test_QQw4aj7lN45CFBnrDrskbkoV']
 }

 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]