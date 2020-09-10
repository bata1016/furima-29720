function price() {
  const PriceInput = document.getElementById('item-price');
  const add_tax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  PriceInput.addEventListener('input', function()  {
    const value = PriceInput.value;
    if (value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gains = value - fee
      add_tax.textContent = parseInt(fee);
      profit.textContent = parseInt(gains);
    } else {
      let fee = '0';
      let profit = '0';
      add_tax.textContent = parseInt(fee);
      profit.textContent = parseInt(gains);
    }
  });
}
window.addEventListener('load', price)
