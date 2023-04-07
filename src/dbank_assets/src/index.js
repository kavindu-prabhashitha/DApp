import {dbank} from "../../declarations/dbank";

window.addEventListener('load',async function(){
    console.log("Finished loading");
    const currentAmount = await dbank.checkBalance();
    this.document.getElementById("value").innerText = currentAmount.toPrecision(8);
})



document.querySelector("form").addEventListener('submit',
 async function(event){
    event.preventDefault();

    const button = event.target.querySelector("#submit-btn");
    console.log("Submitted : "+event)

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);


    await dbank.topUp(inputAmount);

    const currentAmount = await dbank.checkBalance();
    this.document.getElementById("value").innerText = currentAmount.toPrecision(8);

    button.removeAttribute("disabled");

    
})  