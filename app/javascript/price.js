function price (){
  const priceText = document.getElementById("item-price")

  priceText.addEventListener("keyup", () => {
    const priceFee = document.getElementById("add-tax-price")
    const priceProfit = document.getElementById("profit")
    priceFee.innerHTML = (Math.floor(priceText.value * 0.1).toLocaleString())
    priceProfit.innerHTML = (Math.floor(priceText.value * 0.9).toLocaleString())
  })

}

window.addEventListener('load',price)