/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function saveSupplierInfo() {
            var supplierLinks = document.querySelectorAll('.supplier-link');
            supplierLinks.forEach(function(supplierLink) {
                supplierLink.addEventListener('click', function(event) {
                    event.preventDefault();
                    
                    var supplierId = this.parentNode.parentNode.querySelector('th').textContent;
                    var supplierName = this.textContent;
                    var supplierPhone = this.parentNode.parentNode.querySelector('td:nth-child(3)').textContent;
                    var supplierEmail = this.parentNode.parentNode.querySelector('td:nth-child(4)').textContent;
                    var supplierAddress = this.parentNode.parentNode.querySelector('td:nth-child(5)').textContent;
                    
                    var supplierInfo = {
                        id: supplierId,
                        name: supplierName,
                        phone: supplierPhone,
                        email: supplierEmail,
                        address: supplierAddress
                    };
                    
                    localStorage.setItem('selectedSupplier', JSON.stringify(supplierInfo));
                    // Chuyển đến trang import_book.jsp
                    window.location.href = this.href;
                });
            });
        }

// Gọi hàm sau khi trang đã tải hoàn toàn
document.addEventListener('DOMContentLoaded', function() {
    saveSupplierInfo();
});