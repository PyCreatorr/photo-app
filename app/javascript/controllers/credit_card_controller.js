import { Controller } from "@hotwired/stimulus"
import _ from "lodash"

export default class extends Controller {

    static targets = [ "toggleable" ];                  

    // toggle function will be here 
  connect() {
    //this.element.textContent = "Hello World!!!"
  };

  toggle() {
    console.log(this.toggleableTarget);
    this.toggleableTarget.classList.toggle("hidden");    
 };


  handleClick() {
    // this.element.textContent = "Clicked!"
    this.element.textContent = _.intersection([2, 1], [2, 3]);
  };

  submitHandler(event){
    var $form = $(event.target);

    //If Stripe was initialized correctly this will create a token using the credit card info      
    if(Stripe){
      Stripe.card.createToken($form, stripeResponseHandler);     
    } else {
       show_error("Failed to cload credit card processing functionality- Please reload this page in browser.")
    }
     return false;
  };  





}
