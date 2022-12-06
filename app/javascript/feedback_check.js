document.getElementById("create-booking").addEventListener("click", (event) => {
  checkDateValue();
});

document.getElementById("booking_date").addEventListener("change", (event) => {
  console.log('plplllplpl')
  // if (!this.value === null) {
  //   console.log('changed')
  //   document.getElementById("create-booking").disabled = true
  // } else {
  //   console.log('changed')
  //   document.getElementById("create-booking").disabled = false
  // }
});



const checkDateValue = () => {
  if (document.getElementById("booking_date") == null) {
    alert("You need to pick a date!");
  } else {
    alert("it's ok we're happy")
  }
}
