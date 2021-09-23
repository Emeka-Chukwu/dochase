// let events = document.querySelector("#event");

let email = document.getElementById("Email");
let password = document.getElementById("Password");
let button = document.getElementById("submit");




button.addEventListener("click", async (e)=>{
    e.preventDefault();

    let data = { email :email.value, password: password.value}
    console.log(data);
    let create = await    fetch("http://localhost:3000/api/admin/login", {
        method: "post",
        headers: {
            "Content-type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify(data)
    });

    console.log(await create.json());
    console.log(create.status);
    if(create.status){
    localStorage.setItem('token', create.json().token);
    location.replace("./dashboard.html") ;
    // Window.

    }
    // alert("Registration created")
})
