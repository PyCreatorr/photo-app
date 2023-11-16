import { Controller } from "@hotwired/stimulus"

import { get, post, put, patch, destroy } from '@rails/request.js'

export default class extends Controller {

    static targets = [ "toggleable" ];                  

    // toggle function will be here 
  connect() {
    //this.element.textContent = "Hello World!!!"
    //this.element.textContent= "Hello World!"
  };

  //static targets = ["stateSelect"];

  change(event) {
      //console.log("Hello");

      console.log(event.target.selectedOptions[0].value);
      let language = event.target.selectedOptions[0].value;
      //let target = this.stateSelectTarget.id


      let scan_id = window.location.pathname.replace('/scans/','').replace('/edit', '');

      console.log(scan_id);

      patch(`/scans/${scan_id}/languages?scan_id=${scan_id}&language=${language}`,{
        responseKind: "turbo-stream"
      })
      //id="scan_language"
    
    }

  toggle() {
    console.log(this.toggleableTarget);
    this.toggleableTarget.classList.toggle("hidden");    
 };


  handleClick() {
    //console.log(document.getElementById("scan_language").selectedOptions[0].value);
    console.log("FFF");
    //console.log($('#language').selectedOptions[0].value);
    //let selected_value = $('#language').selectedOptions[0].value;

    //$('#generate_report_link').attr('href', new_link_url);
    // this.element.textContent = "Clicked!"
    //this.element.textContent = _.intersection([2, 1], [2, 3]);
  };
}
