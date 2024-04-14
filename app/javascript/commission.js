window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const commissionRate = 0.10; 
      const commissionValue = Math.floor(inputValue * commissionRate);
      const profitValue = Math.floor(inputValue - commissionValue);

      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = commissionValue;

      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = profitValue;
  });
});