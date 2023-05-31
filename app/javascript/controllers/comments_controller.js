import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    initialize() {}
    connect() {}
    toggleForm(event) {
        console.log("toggle");
        event.preventDefault();
        event.stopPropagation();
        const formID = event.params["form"];
        const commentBodyID = event.params["body"];
        const form = document.getElementById(formID);
        form.classList.toggle("w3-hide");
        const commentBody = document.getElementById(commentBodyID);
        commentBody.classList.toggle("w3-hide");        
    }
}
