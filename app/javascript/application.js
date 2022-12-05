// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "bootstrap";


console.log('dont let me down pls');
document.getElementById("create-booking").addEventListener("click", (event) => {
  checkDateValue();
});

document.getElementById("booking_date").addEventListener("change", (event) => {
  if (document.getElementById("booking_date") == null) {
    document.getElementById("create-booking").disabled = true
  } else {
    document.getElementById("create-booking").disabled = false
  }
});



const checkDateValue = () => {
  if (document.getElementById("booking_date") == null) {
    alert("You need to pick a date!");
  }
}
