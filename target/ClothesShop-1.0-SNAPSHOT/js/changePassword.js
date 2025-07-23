
        // Initialize MDB form elements
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize form inputs
            const inputs = document.querySelectorAll('.form-outline input');
            inputs.forEach(input => {
                new mdb.Input(input);
            });
        });

        // Client-side password validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu mới và xác nhận mật khẩu không khớp!');
                return false;
            }

            if (newPassword.length < 6) {
                e.preventDefault();
                alert('Mật khẩu mới phải có ít nhất 6 ký tự!');
                return false;
            }
        });

        // Password strength indicator
        document.getElementById('newPassword').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('strengthBar');
            const strengthText = document.getElementById('strengthText');

            if (!strengthBar) return; // If strength indicator doesn't exist, skip

            let strength = 0;
            let text = '';
            let color = '';

            if (password.length >= 6) strength++;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;

            switch (strength) {
                case 0:
                case 1:
                    text = 'Quá yếu';
                    color = '#dc3545';
                    break;
                case 2:
                    text = 'Yếu';
                    color = '#fd7e14';
                    break;
                case 3:
                    text = 'Trung bình';
                    color = '#ffc107';
                    break;
                case 4:
                    text = 'Tốt';
                    color = '#20c997';
                    break;
                case 5:
                    text = 'Mạnh';
                    color = '#198754';
                    break;
            }

            if (strengthBar) {
                strengthBar.style.width = (strength * 20) + '%';
                strengthBar.style.backgroundColor = color;
            }
            if (strengthText) {
                strengthText.textContent = text;
                strengthText.style.color = color;
            }
        });