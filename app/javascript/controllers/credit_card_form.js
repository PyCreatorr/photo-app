$(document).on('ready turbolinks:load', function() {
    var show_error, stripeResponseHandler, submitHandler; 
  
    submitHandler = function (event){
      var $form = $(event.target);
  
      //If Stripe was initialized correctly this will create a token using the credit card info      
      if(Stripe){
        Stripe.card.createToken($form, stripeResponseHandler);     
      } else {
         show_error("Failed to cload credit card processing functionality- Please reload this page in browser.")
      }
       return false;
    };  
  
    $(".cc_form").on('submit', submitHandler);

    // Get the response from the stripe before the submission:
    stripeResponseHandler = function(status, response){
        var token, $form;
        $form = $('.cc_form');

        console.log('Hello from credit_card_form');
    
        if(response.error){
          console.log(response.error.message);
          show_error(response.error.message);
          $form.find("input[type=submit]").prop("disabled", false);
        } else {
          token = response.id;
          $form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token));
          $("[data-stripe=number]").remove();
          $("[data-stripe=cvc]").remove();
          $("[data-stripe=exp_year]").remove();
          $("[data-stripe=exp_month]").remove();
          $form.get(0).submit();
        }
        return false;
      }


    //show errors if stripe response hve errors:
    show_error = function(message){
        if($("#flash-messages").size() < 1){
            $('div.container.main div:first').prepend("<div id='flash-messages'></div>")            
        }
        $("#flash-messages").html(`<div class="alert alert-warning"><a class="close" data-dismiss="alert">x</a>
        <div id ="flash_alert">${message}</div></div>`);
        $('.alert').delay(5000).fadeOut(3000);
        return false;
    };
  
  });