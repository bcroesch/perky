PKY.CreditCardForm =
  init: ()->
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))

    $('form.credit-card-form').submit =>
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        PKY.CreditCardForm.processCard()
        false
      else
        true

  processCard: ()->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      exp_month: $('#card_month').val()
      exp_year: $('#card_year').val()
    Stripe.createToken card, (status, response) ->
      if status == 200
        $('.stripe-card-token').val(response.id)
        $('form.credit-card-form')[0].submit()
      else
        $('#stripe_error').text(response.error.message)
        $('input[type=submit]').attr('disabled', false)