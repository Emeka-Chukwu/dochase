// let events = document.querySelector("#event");
 let events = document.getElementById("events");
let firstName = document.getElementById("firstname");
let lastName = document.getElementById("lastname");
let email = document.getElementById("email");
let phone = document.getElementById("phone");
let button = document.getElementById("submit");


async function  getEvents() {
   
    console.log("data");

    let data = await fetch("http://localhost:3000/api/events");
    let dataJson = await data.json();
    console.log(dataJson.data);
    dataJson.data.forEach(element=> {
        // <option>Event one</option>
        console.log(events);
       events.innerHTML +=  `
        <option value =${element._id} >${element.title} </option>
        `
       
    });
}


button.addEventListener("click", async (e)=>{
    e.preventDefault();
    let firstName = document.getElementById("firstname");
let lastName = document.getElementById("lastname");
let email = document.getElementById("emailV");
let phone = document.getElementById("phoneV");
    let data = {firstName: firstName.value,lastName: lastName.value, phone: phone.value, email :email.value, event: events.value}
    console.log(data);
    let create = await    fetch("http://localhost:3000/api/attendee", {
        method: "post",
        headers: {
            "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify(data)
    });
    console.log(create.status);
    alert("Registration created")
})
function createEvent(){

}
getEvents();