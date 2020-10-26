const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) =>{
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_purchase[number]"),
      cvc: formData.get("user_purchase[cvc]"),
      exp_month: formData.get("user_purchase[month]"),
      exp_year: `20${formData.get("user_purchase[year]")}`,
    };

    Payjp.createToken(card, (status,response) => {
      if (status == 200) {
        const token = response.id
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);