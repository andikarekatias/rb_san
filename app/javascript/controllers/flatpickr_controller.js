import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {    
    flatpickr(".san_datetime", {
        enableTime: true,
        dateFormat: "l, j F Y H:i K",
    });
  }
}
