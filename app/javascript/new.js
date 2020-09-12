function check() {

  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

    if (price.getAttribute("data-load") != null) {
      return null;
    }
    price.setAttribute("data-load", true);

  price.addEventListener('input', () => {
    const price_value = price.value;
  
    if (price_value >= 300 && price_value <= 9999999){
      let tax_value = price_value * 0.1
      let profit_value = price_value - tax_value
      tax.innerHTML = tax_value;
      profit.innerHTML = profit_value;
    } else {
      tax.innerHTML = "0";
      profit.innerHTML = "0";
    }
    
  });
}
setInterval(check, 1000);
