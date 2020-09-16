if (document.URL.match( /new/ )){
  document.addEventListener('DOMContentLoaded', function() {
    const price = document.getElementById("item-price");
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    
    price.addEventListener('change', () => {
      const price_value = price.value;
      
      if (price_value >= 300 && price_value <= 9999999){
        let tax_value = price_value * 0.1
        let profit_value = price_value - tax_value
        tax.innerHTML = Math.floor(tax_value);
        profit.innerHTML = Math.floor(profit_value);
      } else {
        tax.innerHTML = "0";
        profit.innerHTML = "0";
      }
    });
  });
};
