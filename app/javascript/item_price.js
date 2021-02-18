window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup",() =>{
  
    const inputValue = priceInput.value;
   
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML =Math.floor(inputValue/10);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue*0.9)
 
  })
});