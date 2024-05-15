function restrictToNumbers(inputElement) {
    // Thêm sự kiện nhập vào trường số
    inputElement.addEventListener('input', function (event) {
        // Lấy giá trị nhập vào
        var inputValue = event.target.value.replace(/[^\d]/g, '');
        event.target.value = inputValue;
    });
}

// Hàm để giảm số lượng
function decrementQuantity(button) {
    var input = button.parentNode.parentNode.querySelector('input[type="text"]');
    var value = parseInt(input.value, 10);
    if (isNaN(value)) value = 0;

    if (value <= 1) {
        var row = button.closest('tr');
        $('#confirmationModal').modal('show');
        $('#confirmDeleteBtnModal').off('click').on('click', function () {
            var bookId = row.querySelector('.td-bookId').textContent;
            row.remove();
            var checkboxes = document.querySelectorAll('input[type="checkbox"][value="' + bookId + '"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = false;
            });
            $('#confirmationModal').modal('hide');
        });
    } else {
        input.value = value - 1;
    }
}

// Hàm để tăng số lượng
function incrementQuantity(button) {
    var input = button.parentNode.parentNode.querySelector('input[type="text"]');
    var value = parseInt(input.value, 10);
    if (isNaN(value)) value = 0;
    input.value = value + 1;
}

// Hàm để gắn sự kiện lắng nghe cho các nút trong bảng dưới
function attachEventListeners(row) {
    var buttons = row.querySelectorAll('button');
    buttons.forEach(function (button) {
        if (button.classList.contains('btn-outline-secondary')) {
            if (button.textContent === '-') {
                button.addEventListener('click', function () {
                    decrementQuantity(button);
                });
            } else if (button.textContent === '+') {
                button.addEventListener('click', function () {
                    incrementQuantity(button);
                });
            }
        }
    });
}

// Hàm để xóa sách đã chọn khỏi bảng dưới
function removeBookFromSelectedList(checkbox) {
    var bookId = checkbox.value;
    var selectedTable = document.querySelector('#selectedBooksTable tbody');
    var rows = selectedTable.querySelectorAll('tr');
    rows.forEach(function (row) {
        var rowBookId = row.querySelector('.td-bookId').textContent;
        if (rowBookId === bookId) {
            row.remove();
            return;
        }
    });
}

// Hàm để thêm sách đã chọn vào bảng dưới
function addBookToSelectedList(checkbox) {
    var row = checkbox.parentNode.parentNode;
    var newRow = row.cloneNode(true);
    var checkboxCell = newRow.querySelector('.td-checkbox');
    checkboxCell.innerHTML = '<div class="input-group input-group-sm"> \
                            <div class="input-group-prepend"> \
                                <button class="btn btn-outline-secondary" type="button">-</button> \
                            </div> \
                            <input type="text" class="form-control text-center" value="1" aria-label="Quantity" aria-describedby="btnMinus btnPlus"> \
                            <div class="input-group-append"> \
                                <button class="btn btn-outline-secondary" type="button">+</button> \
                            </div> \
                          </div>';
    var selectedTable = document.querySelector('#selectedBooksTable tbody');
    selectedTable.appendChild(newRow);
    restrictToNumbers(newRow.querySelector('input[type="text"]')); // Gắn sự kiện nhập số cho ô số lượng trong hàng mới
    attachEventListeners(newRow);
}

// Gắn sự kiện nhập số vào trường input số lượng
document.addEventListener("DOMContentLoaded", function () {
    var quantityInput = document.getElementById('quantityInput');
    if (quantityInput) {
        restrictToNumbers(quantityInput);
    }
});

// Bắt sự kiện cho các checkbox trong bảng listBook
document.addEventListener("DOMContentLoaded", function () {
    var table = document.querySelector('#listBook');

    table.addEventListener('click', function (event) {
        var target = event.target;
        if (target.type === 'checkbox' && target.name === 'selectedBooks') {
            if (target.checked) {
                addBookToSelectedList(target);
            } else {
                removeBookFromSelectedList(target);
            }
        }
    });
});

function saveSelectedBooksToLocalStorage() {
    var selectedBooks = [];
    var selectedRows = document.querySelectorAll('#selectedBooksTable tbody tr');

    selectedRows.forEach(function (row) {
        var bookId = row.querySelector('.td-bookId').textContent;
        var bookName = row.querySelector('.td-bookName').textContent;
        var bookAuthor = row.querySelector('.td-bookAuthor').textContent;
        var bookPrice = row.querySelector('.td-bookPrice').textContent;
        var bookCategories = row.querySelector('.td-bookCategories').textContent;
        var bookStatus = row.querySelector('.td-bookStatus').textContent;
        var quantity = row.querySelector('input[type="text"]').value;

        selectedBooks.push({
            bookId: bookId,
            bookName: bookName,
            bookAuthor: bookAuthor,
            bookPrice: bookPrice,
            bookCategories: bookCategories,
            bookStatus: bookStatus,
            quantity: quantity
        });
    });

    localStorage.setItem('selectedBooks', JSON.stringify(selectedBooks));
}

document.addEventListener("DOMContentLoaded", function () {
    var nextButton = document.getElementById("nextButton");
    if (nextButton) {
        nextButton.addEventListener("click", function () {
            try {
                saveSelectedBooksToLocalStorage();
                window.location.href = 'create_imported_bill.jsp';
            } catch (error) {
                console.error('Lỗi khi lưu dữ liệu vào localStorage:', error);
            }
        });
    }
});
