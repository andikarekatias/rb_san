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
        const editButtonID = event.params["edit"];

        const form = document.getElementById(formID);
        const commentBody = document.getElementById(commentBodyID);
        const editButton = document.getElementById(editButtonID);

        form.classList.toggle("w3-hide");        
        commentBody.classList.toggle("w3-hide");        
        this.toogleEditButton(editButton);
    }
    toogleEditButton(editButton) {
        if (editButton.innerText === "Edit") {
            editButton.innerText = "Cancel";
            this.toogleEditButtonClass(editButton);
        }else{
            editButton.innerText = "Edit";
            this.toogleEditButtonClass(editButton);
        }
    }
    toogleEditButtonClass(editButton){
        editButton.classList.toggle("w3-yellow");
        editButton.classList.toggle("w3-green");
    }
}
