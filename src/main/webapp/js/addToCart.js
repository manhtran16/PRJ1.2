document.addEventListener("DOMContentLoaded", function () {
  const addToCartButtons = document.querySelectorAll(".add-to-cart-btn");

  addToCartButtons.forEach(function (button) {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      const productId = this.dataset.productId;
      const quantity = this.dataset.quantity || 1;

      fetch("/add-to-cart", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ productId, quantity }),
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.success) {
            alert("Thêm mặt hàng vào giỏ thành công");
            // Optionally update cart UI here
          } else {
            alert("Lỗi khi thêm vào giỏ hàng.");
          }
        })
        .catch((error) => {
          console.error("Error:", error);
          alert("An error occurred.");
        });
    });
  });
});
