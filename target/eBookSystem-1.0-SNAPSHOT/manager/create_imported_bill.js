// Lấy thông tin về sách đã chọn từ local storage
var selectedBooks = JSON.parse(localStorage.getItem('selectedBooks'));    
// Lấy thông tin về nhà cung cấp từ local storage
var selectedSupplier = JSON.parse(localStorage.getItem('selectedSupplier')); 
// Biến cờ để kiểm soát việc gọi hàm saveBill()
var saveBillCalled = false; 
document.addEventListener('DOMContentLoaded', function() {
    // Hiển thị thông tin về nhà cung cấp trên form hóa đơn
    document.getElementById('supplier_name').textContent = selectedSupplier.name;
    document.getElementById('supplier_phone').textContent = selectedSupplier.phone;
    document.getElementById('supplier_email').textContent = selectedSupplier.email;
    document.getElementById('supplier_address').textContent = selectedSupplier.address;

    //Hien thi ngay gio
    var importedDateElement = document.getElementById('imported_date');
    // Tạo một đối tượng Date mới chứa ngày giờ hiện tại
    var currentDate = new Date();
    // Format ngày giờ hiện tại theo định dạng mong muốn
    var formattedDate = currentDate.toLocaleString(); // Sử dụng toLocaleString() để format ngày giờ hiện tại
    // Gán ngày giờ đã được format vào nội dung của thẻ p
    importedDateElement.textContent = formattedDate;
    
    // Hiển thị thông tin về sách đã chọn trên form hóa đơn
    var selectedBooksTable = document.getElementById('selectedBooksTable');
    var totalAmount = 0;
    selectedBooks.forEach(function(book, index) {
        var row = selectedBooksTable.insertRow();
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var price = parseFloat(book.bookPrice);
        var totalPrice = price * parseInt(book.quantity);
        totalAmount += totalPrice;
        
        cell1.textContent = index + 1;
        cell2.textContent = book.bookName;
        cell3.textContent = '$' + price.toFixed(2);
        cell4.textContent = book.quantity;
        cell5.textContent = '$' + totalPrice.toFixed(2);
    });

    // Add Sub Total row
    var subtotalRow = selectedBooksTable.insertRow();
    var subtotalCell = subtotalRow.insertCell(0);
    subtotalCell.colSpan = 4;
    subtotalCell.textContent = 'Sub Total:';
    var subtotalValueCell = subtotalRow.insertCell(1);
    subtotalValueCell.textContent = '$' + totalAmount.toFixed(2);

//    // Add Discount row
//    var discountRow = selectedBooksTable.insertRow();
//    var discountCell = discountRow.insertCell(0);
//    discountCell.colSpan = 4;
//    discountCell.textContent = 'Discount:';
//    var discountValueCell = discountRow.insertCell(1);
//    discountValueCell.textContent = '- $25.50';
//
//    // Add Shipping Charge row
//    var shippingChargeRow = selectedBooksTable.insertRow();
//    var shippingChargeCell = shippingChargeRow.insertCell(0);
//    shippingChargeCell.colSpan = 4;
//    shippingChargeCell.textContent = 'Shipping Charge:';
//    var shippingChargeValueCell = shippingChargeRow.insertCell(1);
//    shippingChargeValueCell.textContent = '$20.00';
//
//    // Add Tax row
//    var taxRow = selectedBooksTable.insertRow();
//    var taxCell = taxRow.insertCell(0);
//    taxCell.colSpan = 4;
//    taxCell.textContent = 'Tax:';
//    var taxValueCell = taxRow.insertCell(1);
//    taxValueCell.textContent = '$12.00';

    // Add Total row
    var totalRow = selectedBooksTable.insertRow();
    var totalCell = totalRow.insertCell(0);
    totalCell.colSpan = 4;
    totalCell.textContent = 'Total:';
    var totalValueCell = totalRow.insertCell(1);
    totalValueCell.innerHTML = '<h4 class="m-0 fw-semibold" id="total_amount">$' + (totalAmount).toFixed(2) + '</h4>';
});

function saveBill() {
    // Kiểm tra xem hàm đã được gọi trước đó hay không
    if (saveBillCalled) {
        return;
    }
    saveBillCalled = true;
    var importedDate = document.getElementById('imported_date').textContent;
    console.log(importedDate);
    var totalAmount = parseFloat(document.getElementById('total_amount').textContent.replace('$', ''));
    console.log(totalAmount);
    var selectedBooksTable = document.getElementById('selectedBooksTable');
    var tableRows = selectedBooksTable.getElementsByTagName('tr');
    var imported_books = [];
    for (var i = 1; i < tableRows.length; i++) { // Start from index 1 to skip the header row
        var cells = tableRows[i].getElementsByTagName('td');
        if (i - 1 < selectedBooks.length) { // Check if the index is within the range of selectedBooks
            var book_id = selectedBooks[i - 1].bookId;
            console.log("Book ID:", book_id); // Log the value of bookId
            var imported_book_quantity = parseInt(cells[3].textContent);
            console.log("Imported Book Quantity:", imported_book_quantity); // Log the value of imported_book_quantity
            var imported_book = {
                bookId: book_id,
                quantity: imported_book_quantity
            };
            imported_books.push(imported_book);
        }
    }

    var data = {
        supplierId : selectedSupplier.id,
        importedDate : importedDate,
        imported_books: imported_books,
        totalAmount : totalAmount
    };
    console.log(data);
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'saveBillServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            console.log(response)
            if (response.status === 'success' && response.result === 'true') {
                // Show success modal
                $('#successModal').modal('show');
            } else {
                // Show error modal
                $('#errorModal').modal('show');
            }
        } else {
            // Show error modal
            $('#errorModal').modal('show');
        }
    };
    xhr.onerror = function() {
        // Show error modal
        $('#errorModal').modal('show');
    };
    xhr.send(JSON.stringify(data));
}


$(document).ready(function() {
    // Xóa trình lắng nghe sự kiện thừa trước khi thêm mới
    $('#successModal').off('shown.bs.modal');
    $('#errorModal').off('hidden.bs.modal');

    // Thêm trình lắng nghe sự kiện mới
    $('#successModal').on('shown.bs.modal', function(e) {
        // Kiểm tra xem hàm saveBill() đã được gọi trước đó hay không
        if (!saveBillCalled) {
            saveBill();
        }
    });

    $('#successModal').on('hidden.bs.modal', function(e) {
        window.location.href = './home.jsp'; // Replace '/' with the URL of your homepage
    });

    $('#errorModal').on('hidden.bs.modal', function(e) {
        // Kiểm tra xem hàm saveBill() đã được gọi trước đó hay không
        if (!saveBillCalled) {
            window.location.href = './search_supplier.jsp'; // Replace '/importbook' with the URL of your importbook page
        }
    });
});