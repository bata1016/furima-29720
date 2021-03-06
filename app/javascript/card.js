const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    // なぜインスタンスを生成している？
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      
      // なぜname属性を取り除いている？→カラム名=name属性となっている。
      document.getElementById("card-number").removeAttribute('name');
      document.getElementById("card-exp-year").removeAttribute('name');
      document.getElementById("card-exp-month").removeAttribute('name');
      document.getElementById('card-cvc').removeAttribute('name');

      document.getElementById('charge-form').submit();
      document.getElementById('charge-form').reset();
      } else {
        document.getElementById('charge-form').submit();
        document.getElementById('charge-form').reset();        
        const submit_btn = document.getElementsByClassName('buy-red-btn')[0];
        submit_btn.disabled = false;
      }
    });
  });
};

window.addEventListener("load", pay)