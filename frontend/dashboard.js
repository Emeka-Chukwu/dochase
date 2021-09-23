let events = document.getElementById("events");
let rowTable = document.getElementById("rowTable")
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

getEvents();

async function  getAllUsers() {
   
    console.log("data");

    let data = await fetch("http://localhost:3000/api/attendee/"+events.value);
    let dataJson = await data.json();
    console.log(dataJson.data);
        rowTable.innerHTML = "";
        let dataValue = []
    let value = dataJson.data.forEach(e=> {
        if(e.status == "pending"){
        dataValue.push(e);
        }
      });
    console.log(value);
    console.log(dataValue);
    dataValue.forEach(element=> {
        // <option>Event one</option>
        console.log(events);
       rowTable.innerHTML +=  `
         <tr>
                            <td>${element.firstName} ${element.lastName}</td>
                            <td class="text-center">
                                <button class="btn btn-primary">ADMIT</button>
                                <button class="btn btn-danger">REJECT</button>
                            </td>
                        </tr>
        `
       
    });
}