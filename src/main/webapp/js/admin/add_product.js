
        function addDynamicField(containerId, template) {
            const container = document.getElementById(containerId);
            const newField = document.createElement('div');
            newField.className = 'dynamic-field mt-3';
            newField.innerHTML = template + '<button type="button" class="btn-close remove-field" onclick="this.parentElement.remove()"></button>';
            container.appendChild(newField);
        }

        function toggleOtherSizeInput(checkbox) {
            var input = document.getElementById('otherSizeInput');
            if (checkbox.checked) {
                input.style.display = 'inline-block';
                input.required = true;
            } else {
                input.style.display = 'none';
                input.value = '';
                input.required = false;
            }
            updateVariantTable();
        }

        function toggleOtherColorInput(checkbox) {
            var input = document.getElementById('otherColorInput');
            if (checkbox.checked) {
                input.style.display = 'inline-block';
                input.required = true;
            } else {
                input.style.display = 'none';
                input.value = '';
                input.required = false;
            }
            updateVariantTable();
        }

        function getSelectedSizes() {
            let sizes = [];
            document.querySelectorAll('.size-checkbox').forEach(cb => {
                if (cb.checked && cb.id !== 'sizeOther')
                    sizes.push(cb.value);
            });
            const otherSizeCb = document.getElementById('sizeOther');
            const otherSizeInput = document.getElementById('otherSizeInput');
            if (otherSizeCb && otherSizeCb.checked && otherSizeInput.value.trim() !== '') {
                sizes.push(otherSizeInput.value.trim());
            }
            return sizes;
        }

        function getSelectedColors() {
            let colors = [];
            document.querySelectorAll('.color-checkbox').forEach(cb => {
                if (cb.checked && cb.id !== 'colorOther')
                    colors.push(cb.value);
            });
            const otherColorCb = document.getElementById('colorOther');
            const otherColorInput = document.getElementById('otherColorInput');
            if (otherColorCb && otherColorCb.checked && otherColorInput.value.trim() !== '') {
                colors.push(otherColorInput.value.trim());
            }
            return colors;
        }

        function updateVariantTable() {
            const sizes = getSelectedSizes();
            const colors = getSelectedColors();
            const container = document.getElementById('variantTableContainer');
            container.innerHTML = '';
            if (sizes.length === 0 || colors.length === 0)
                return;

            let html = '<table class="table table-bordered"><thead><tr><th>Size</th><th>Màu</th><th>Số lượng</th><th>Image URL</th></tr></thead><tbody>';
            sizes.forEach(size => {
                colors.forEach(color => {
                    html += `<tr>
                        <td><input type="hidden" name="variantSize[]" value="` + size + `">` + size + `</td>
                        <td><input type="hidden" name="variantColor[]" value="` + color + `">` + color + `</td>
                        <td><input type="number" name="variantQuantity[]" class="form-control" min="0" required></td>
                        <td><input type="text" name="variantImage[]" class="form-control" placeholder="Nhập URL ảnh"></td>
                    </tr>`;
                });
            });
            html += '</tbody></table>';
            container.innerHTML = html;
        }

        function attachVariantEvents() {
            document.querySelectorAll('.size-checkbox, .color-checkbox').forEach(cb => {
                cb.addEventListener('change', updateVariantTable);
            });
            document.getElementById('otherSizeInput').addEventListener('input', updateVariantTable);
            document.getElementById('otherColorInput').addEventListener('input', updateVariantTable);
        }

        window.onload = function () {
            attachVariantEvents();
            updateVariantTable();
        };
