
    document.addEventListener('DOMContentLoaded', function () {
        // Lấy các phần tử input
        const minPriceInput = document.getElementById('minPrice');
        const maxPriceInput = document.getElementById('maxPrice');

        // Lấy các phần tử hiển thị lỗi
        const minPriceError = document.getElementById('minPriceError');
        const maxPriceError = document.getElementById('maxPriceError');
        const priceRangeError = document.getElementById('priceRangeError');

        // Lấy form (để ngăn chặn submit nếu có lỗi)
        const filterForm = document.getElementById('filterForm');

        // Hàm kiểm tra và hiển thị lỗi giá
        function validatePriceRange() {
            // Lấy giá trị và chuyển đổi sang số. Nếu trống hoặc không phải số, coi là null.
            const minPrice = minPriceInput.value.trim() !== '' ? parseFloat(minPriceInput.value) : null;
            const maxPrice = maxPriceInput.value.trim() !== '' ? parseFloat(maxPriceInput.value) : null;

            // -----------------------------------------------------
            // 1. Xóa tất cả các thông báo lỗi cũ và trạng thái không hợp lệ
            // -----------------------------------------------------
            minPriceError.textContent = '';
            maxPriceError.textContent = '';
            priceRangeError.textContent = '';
            minPriceInput.setCustomValidity(''); // Xóa lỗi validation của trình duyệt
            maxPriceInput.setCustomValidity('');

            let isValid = true; // Biến cờ để theo dõi trạng thái hợp lệ

            // -----------------------------------------------------
            // 2. Kiểm tra tính hợp lệ cơ bản của từng input (nếu có giá trị nhập vào)
            // -----------------------------------------------------
            if (minPrice !== null && (isNaN(minPrice) || minPrice < 0)) {
                minPriceError.textContent = 'Giá trị tối thiểu không hợp lệ.';
                minPriceInput.setCustomValidity('Giá trị tối thiểu không hợp lệ.'); // Đặt lỗi cho trình duyệt
                isValid = false;
            }
            if (maxPrice !== null && (isNaN(maxPrice) || maxPrice < 0)) {
                maxPriceError.textContent = 'Giá trị tối đa không hợp lệ.';
                maxPriceInput.setCustomValidity('Giá trị tối đa không hợp lệ.'); // Đặt lỗi cho trình duyệt
                isValid = false;
            }

            // -----------------------------------------------------
            // 3. Kiểm tra điều kiện minPrice < maxPrice
            //    Chỉ kiểm tra nếu CẢ HAI giá trị đã được nhập và đã qua kiểm tra cơ bản
            // -----------------------------------------------------
            if (isValid && minPrice !== null && maxPrice !== null && minPrice >= maxPrice) {
                priceRangeError.textContent = 'Giá tối thiểu phải nhỏ hơn giá tối đa.';
                // Đặt lỗi cho cả hai input để trình duyệt hiển thị pop-up khi submit
                minPriceInput.setCustomValidity('Giá tối thiểu phải nhỏ hơn giá tối đa.');
                maxPriceInput.setCustomValidity('Giá tối thiểu phải nhỏ hơn giá tối đa.');
                isValid = false;
            }

            return isValid; // Trả về true nếu hợp lệ, false nếu có lỗi
        }

        // -----------------------------------------------------
        // Lắng nghe sự kiện 'input' để kiểm tra liên tục khi người dùng gõ
        // -----------------------------------------------------
        minPriceInput.addEventListener('input', validatePriceRange);
        maxPriceInput.addEventListener('input', validatePriceRange);

        // -----------------------------------------------------
        // Lắng nghe sự kiện 'submit' của form để ngăn chặn gửi đi nếu có lỗi
        // -----------------------------------------------------
        if (filterForm) { // Đảm bảo form tồn tại
            filterForm.addEventListener('submit', function (event) {
                if (!validatePriceRange()) { // Nếu hàm validate trả về false (có lỗi)
                    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định
                    // Trình duyệt sẽ tự động focus vào input lỗi đầu tiên
                }
            });
        }

        // -----------------------------------------------------
        // Gọi hàm kiểm tra một lần khi trang tải (để kiểm tra giá trị mặc định)
        // -----------------------------------------------------
        validatePriceRange();
    });