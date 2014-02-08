class PKY.Accounts
  initEdit: ()->
    PKY.CreditCardForm.init()
    $("#update_card_button").click ()->
      $(".credit-card-fields").toggle()

    $('.change-plan-button').click ()->
      url = @href
      $('#changePlanModal').modal('hide')
      bootbox.confirm "Are you sure you want to change your plan? Plan changes are immediate.", (result)->
        if result
          $.ajax
            url: url,
            type: 'PATCH'
           .error (jqXHR, status, err)->
              noty(layout: 'topRight', type: 'error', text: "There was an error changing your plan.");
           .success (data, status, jqXHR)->
              noty(layout: 'topRight', type: 'success', text: "Your plan was successfully updated.");
              $('span.plan-name').html(data.name);
      false

    $('.cancel-plan-button').click ()->
      url = @href
      bootbox.confirm "Are you sure you want to cancel your plan? Plan changes are immediate.", (result)->
        if result
          $.ajax
            url: url,
            type: 'DELETE'
           .error (jqXHR, status, err)->
              noty(layout: 'topRight', type: 'error', text: "There was an error cancelling your plan.");
           .success (data, status, jqXHR)->
              noty(layout: 'topRight', type: 'success', text: "Your plan was cancelled.");
              window.location = "/deals"
      false

  initUpdate: ()->
    @initEdit()