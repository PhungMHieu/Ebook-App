package com.manager.servlet;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.DAO.ImportedBillDAOImpl;
import com.DB.DBConnect;
import com.entity.ImportedBill;
import com.entity.ImportedBook;
import com.entity.User;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="SaveImportedBillServlet",urlPatterns={"/manager/saveBillServlet"})
public class SaveImportedBillServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Lấy đối tượng user từ session
//        try {
            User user = (User) session.getAttribute("userobj");
            if (user != null) {
                // Đọc dữ liệu JSON được gửi từ trình duyệt web
                BufferedReader reader = request.getReader();
                StringBuilder jsonBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }
                reader.close();
                String jsonData = jsonBuilder.toString();
                //System.out.println(jsonData);

                // Chuyển đổi dữ liệu JSON thành đối tượng JsonObject
                JsonElement jsonElement = JsonParser.parseString(jsonData);
                JsonObject jsonObject = jsonElement.getAsJsonObject();

                // Đọc thông tin nhà cung cấp 
                int supplierId = jsonObject.get("supplierId").getAsInt();
                ImportedBill importedBill = new ImportedBill();
                importedBill.setIdSupplier(supplierId);
                //System.out.println("Supplier id: " + importedBill.getIdSupplier());
                importedBill.setIdUser(user.getId());
                //System.out.println("User id: " + importedBill.getIdUser());
                double total_amount = jsonObject.get("totalAmount").getAsDouble();
                importedBill.setTotal_amount(total_amount);
                //System.out.println("Total amount: " + importedBill.getTotal_amount());
                //System.out.println("Step 1: " + jsonObject.get("importedDate").getAsString());
//                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("M/d/yyyy, h:mm:ss a");
                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("HH:mm:ss d/M/yyyy");
                LocalDateTime imported_date = LocalDateTime.parse(jsonObject.get("importedDate").getAsString(), dateFormatter);
                System.out.println(imported_date);
                importedBill.setImportedDate(imported_date);
                //System.out.println("Step 2" + importedBill.getImportedDate());
                //Đọc danh sách sách nhập hàng từ JsonObject
                //System.out.println("Step 3: ");
                JsonArray importedBooksArray = jsonObject.getAsJsonArray("imported_books");
                //System.out.println("Step 4: ");
                //System.out.println("importedBooksArray: " + importedBooksArray.toString());
                // Đọc danh sách sách nhập hàng
                List<ImportedBook> importedBooks = new ArrayList<>();
                for (JsonElement element : importedBooksArray) {
                    JsonObject bookObject = element.getAsJsonObject();
                    int bookId = bookObject.get("bookId").getAsInt();
                    int quantity = bookObject.get("quantity").getAsInt();
                    ImportedBook importedBook = new ImportedBook();
                    importedBook.setIdBookDtls(bookId);
                    importedBook.setImportedQuantity(quantity);
                    System.out.println("Imported ID Book:" + importedBook.getIdBookDtls());
                    System.out.println("Imported Quantity:" + importedBook.getImportedQuantity());
                    importedBooks.add(importedBook);
                }
                importedBill.setImportedBookDtlses(importedBooks);
                // Lưu thông tin hóa đơn vào cơ sở dữ liệu hoặc thực hiện các hành động khác ở đây
                ImportedBillDAOImpl importedBillDAO = new ImportedBillDAOImpl(DBConnect.getConn());
                boolean check = importedBillDAO.saveImportedBill(importedBill);
                // Gửi phản hồi về trình duyệt web
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                JsonObject responseJson = new JsonObject();
                responseJson.addProperty("status", "success");
                responseJson.addProperty("result", String.valueOf(check));
                System.out.println(responseJson.toString());
                out.print(responseJson.toString());
                out.flush();
            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        
    }
}
