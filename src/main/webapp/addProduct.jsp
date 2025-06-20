<div class="mb-3">
    <label class="form-label">Màu sắc</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorRed" name="color" value="Đỏ">
        <label class="form-check-label" for="colorRed">Đỏ</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorBlue" name="color" value="Xanh dương">
        <label class="form-check-label" for="colorBlue">Xanh dương</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorBlack" name="color" value="Đen">
        <label class="form-check-label" for="colorBlack">Đen</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorWhite" name="color" value="Trắng">
        <label class="form-check-label" for="colorWhite">Trắng</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorYellow" name="color" value="Vàng">
        <label class="form-check-label" for="colorYellow">Vàng</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="colorOther" name="color" value="" onchange="toggleOtherColorInput(this)">
        <label class="form-check-label" for="colorOther">Khác</label>
    </div>
    <input type="text" class="form-control mt-2" id="otherColorInput" name="colorOther" placeholder="Nhập màu khác..." style="display:none; max-width:250px;">
</div>

<script>
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
}
</script>