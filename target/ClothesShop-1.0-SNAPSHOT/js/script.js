
        document.querySelectorAll('.color-box').forEach(button => {
            button.addEventListener('click', function () {
                document.querySelectorAll('.color-box').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                document.getElementById('selectedColor').value = this.dataset.color;
            });
        });

        document.querySelectorAll('.size-btn').forEach(button => {
            button.addEventListener('click', function () {
                document.querySelectorAll('.size-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                document.getElementById('selectedSize').value = this.dataset.size;
            });
        });

        document.getElementById('increase').addEventListener('click', function () {
            const quantityInput = document.getElementById('quantity');
            let value = parseInt(quantityInput.value);
            if (!isNaN(value)) {
                quantityInput.value = value + 1;
            }
        });

        document.getElementById('decrease').addEventListener('click', function () {
            const quantityInput = document.getElementById('quantity');
            let value = parseInt(quantityInput.value);
            if (!isNaN(value) && value > 1) {
                quantityInput.value = value - 1;
            }
        });

        // Optional: prevent submission if color or size not selected
        function prepareFormData() {
            const color = document.getElementById('selectedColor').value;
            const size = document.getElementById('selectedSize').value;
            if (!color || !size) {
                alert('Vui lòng chọn màu và kích thước!');
                return false;
            }
            return true;
        }