function restrictToNumbers(inputElement) {
    // Thêm sự kiện nhập vào trường số
    inputElement.addEventListener('input', function (event) {
        // Lấy giá trị nhập vào
        var inputValue = event.target.value;
        // Kiểm tra nếu giá trị nhập không phải là số
        if (isNaN(inputValue)) {
            // Xóa bất kỳ ký tự không phải số nào được nhập vào trường
            event.target.value = inputValue.replace(/[^\d]/g, '');
        }
    });
}

// Hàm để giảm số lượng
function decrementQuantity(button) {
    var input = button.parentNode.parentNode.parentNode.querySelector('input[type="text"]');
    var value = parseInt(input.value, 10);
    if (value === 1) {
        var row = button.closest('tr');
        $('#confirmationModal').modal('show');
        $('#confirmDeleteBtnModal').click(function () {
            row.remove();
            var bookId = button.parentNode.parentNode.parentNode.parentNode.querySelector('.td-bookId').textContent;
            console.log(bookId);
            var checkboxes = document.querySelectorAll('input[type="checkbox"][value="' + bookId + '"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = false;
            });
//            var event = new CustomEvent('bookDeleted', { detail: { bookId: bookId } });
//            button.dispatchEvent(event); // Kích hoạt sự kiện bookDeleted trên button
            $('#confirmationModal').modal('hide');
            saveSelectedBooksToLocalStorage();
        });
    } else if (value > 1) {
        input.value = value - 1;
    }
}

//// Ở một nơi khác trong ứng dụng
//document.addEventListener('bookDeleted', function(event) {
//    var bookId = event.detail.bookId; // Truy cập bookId từ event
//    console.log("Hi" + bookId);
//    var checkboxes = document.querySelectorAll('input[type="checkbox"][value="' + bookId + '"]');
//    
//});

// Hàm để tăng số lượng
function incrementQuantity(button) {
    var input = button.parentNode.parentNode.querySelector('input[type="text"]');
    var value = parseInt(input.value, 10);
    console.log("Value before increment:", value);
    input.value = value + 1;
    console.log("Value after increment:", value + 1);
}

// Hàm để gắn sự kiện lắng nghe cho các nút trong bảng dưới
function attachEventListeners() {
    var selectedTable = document.querySelector('#selectedBooksTable tbody');
    var buttons = selectedTable.querySelectorAll('button');
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
                            <input type="text" class="form-control text-center" value="1" id="quantityInput" aria-label="Quantity" aria-describedby="btnMinus btnPlus"> \
                            <div class="input-group-append"> \
                                <button class="btn btn-outline-secondary" type="button" >+</button> \
                            </div> \
                          </div>';
    var selectedTable = document.querySelector('#selectedBooksTable tbody');
    selectedTable.appendChild(newRow);
    console.log(newRow);
    restrictToNumbers(newRow.querySelector('#quantityInput')); // Gắn sự kiện nhập số cho ô số lượng trong hàng mới
    // attachEventListeners();
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
    var lastCheckedState = {};

    table.addEventListener('click', function (event) {
        var target = event.target;
        if (target.type === 'checkbox' && target.name === 'selectedBooks') {
            var isChecked = lastCheckedState[target.value];
            if (isChecked) {
                removeBookFromSelectedList(target);
            } else {
                addBookToSelectedList(target);
            }
            lastCheckedState[target.value] = !isChecked;
        }
    });
});



function saveSelectedBooksToLocalStorage() {
    var selectedBooks = [];
    var selectedRows = document.querySelectorAll('#selectedBooksTable tbody tr');
    
    selectedRows.forEach(function(row) {
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

document.addEventListener("DOMContentLoaded", function() {
    var nextButton = document.getElementById("nextButton");
    console.log(nextButton); // Kiểm tra xem nextButton có được chọn đúng không
    if (nextButton) {
        nextButton.addEventListener("click", function() {
            // Xử lý sự kiện khi nút "Next" được click
            // Lưu thông tin về các sách đã chọn vào local storage
            saveSelectedBooksToLocalStorage();

            // Chuyển qua trang tiếp theo
            window.location.href = 'create_imported_bill.jsp';
        });
    }
});

