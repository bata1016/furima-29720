 function addTax() {
  let item_price = document.getElementById('item-price');
  item_price.addEventListener('input', function() { 
    let tax_price = item_price.value * 0.1
    let profit = item_price.value - tax_price
    document.getElementById('add-tax-price').innerHTML = tax_price
    document.getElementById('profit').innerHTML = profit
  })
  }
window.addEventListener('load',addTax)