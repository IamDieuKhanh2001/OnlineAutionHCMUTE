package com.ute.onlineautionhcmute.filters;

import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.beans.Winner;
import com.ute.onlineautionhcmute.models.ProductModel;
import com.ute.onlineautionhcmute.models.UserModel;
import com.ute.onlineautionhcmute.models.WinnerModel;
import com.ute.onlineautionhcmute.utils.EmailTemplate;
import com.ute.onlineautionhcmute.utils.SendEmail;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

@WebFilter(filterName = "CheckWinnerFilter")
public class CheckWinnerFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String fileLogsName = "logs_email_to_seller.txt";
        List<Product> products = ProductModel.findAll();
        for (Product product : products){
            if(product.getEnd_time().after(new Date()) == false) // Sản phảm đã hết hạn
            {
                boolean isSentEmail = false; // Cờ hiệu kiểm tra coi sản phẩm này được gửi mail cho người bán hay chưa
                try
                {
                    File fileLogs = new File(fileLogsName);
                    Scanner myReader = new Scanner(fileLogs);
                    while (myReader.hasNextLine()) {
                        String line = myReader.nextLine();
                        if(line.contains(String.valueOf(product.getId())))
                        {
                            isSentEmail = true;
                            break;
                        }
                    }
                    myReader.close();
                } catch (Exception ex) {}

                if(product.getUser_id_holding_price() != 0 && WinnerModel.findByProductID(product.getId()) == null) // Đã có người đặt giá và bảng winner chưa insert vào người này đã thắng
                {
                    Winner winner = new Winner(-1, product.getUser_id_holding_price(),product.getId());
                    WinnerModel.add(winner); // Thêm người thắng vào bảng Winner

                    // Gửi mail đến người thắng
                    User userWinner = UserModel.findById(product.getUser_id_holding_price()); // Lấy thông tin người thắng
                    Thread threadSendEmailBidder = new Thread(()->{
                        try {
                            if(userWinner == null)
                                return;

                            String emailTo = userWinner.getEmail();
                            String title = "Your product has expired";
                            String contentMain = "You have an expired product. There is already a winner for your product. Your product has a name: <h1><b>[name]</b></h1>";
                            contentMain = contentMain.replace("[name]", product.getName());
                            String content = EmailTemplate.TemplateNotification("Your product has expired", contentMain);
                            SendEmail.sendAsHtml(emailTo, title, content);
                        } catch (Exception ex) {
                        }
                    });
                    threadSendEmailBidder.start();
                    // End Send Email

                    // Gửi mail cho người bán với nội dung hết hạn và đã có người thắng
                    if(isSentEmail)
                    {
                        User userSeller = UserModel.findById(product.getUser_id()); // Lấy thông tin người bán
                        Thread threadSendEmailSeller = new Thread(()->{
                            try {
                                if(userSeller == null)
                                    return;
                                String emailTo = userSeller.getEmail();
                                String title = "Your product has expired";
                                String contentMain = "You have an expired product, but no one has bid on your product. Your product has a name: <h1><b>[name]</b></h1>";
                                contentMain = contentMain.replace("[name]", product.getName());
                                String content = EmailTemplate.TemplateNotification("Your product has expired", contentMain);
                                SendEmail.sendAsHtml(emailTo, title, content);
                            } catch (Exception ex) {
                            }
                        });
                        threadSendEmailSeller.start();

                        // Khi vào file logs đã gửi mail
                        try
                        {
                            FileWriter fw = new FileWriter(fileLogsName);
                            fw.write(product.getId() + "\n");
                        } catch (Exception ex) {}
                    }
                    // End Send Email
                }
                else
                {
                    // Gửi mail cho người bán với nội dung hết hạn mà không ai đặt giá
                    if(isSentEmail)
                    {
                        User userSeller = UserModel.findById(product.getUser_id()); // Lấy thông tin người bán
                        Thread threadSendEmail = new Thread(()->{
                            try {
                                if(userSeller == null)
                                    return;
                                String emailTo = userSeller.getEmail();
                                String title = "Your product has expired";
                                String contentMain = "You have an expired product, the product is name: <h1><b>[name]</b></h1>";
                                contentMain = contentMain.replace("[name]", product.getName());
                                String content = EmailTemplate.TemplateNotification("Your product has expired", contentMain);
                                SendEmail.sendAsHtml(emailTo, title, content);
                            } catch (Exception ex) {
                            }
                        });
                        threadSendEmail.start();

                        // Khi vào file logs đã gửi mail
                        try
                        {
                            FileWriter fw = new FileWriter(fileLogsName);
                            fw.write(product.getId() + "\n");
                        } catch (Exception ex) {}
                    }
                    // End Send Email
                }
            }
        }

        chain.doFilter(request, response);
    }
}
