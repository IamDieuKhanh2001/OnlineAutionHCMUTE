package com.ute.onlineautionhcmute.utils;

import com.ute.onlineautionhcmute.beans.User;

public class EmailTemplate {
    public static String TemplateRecoverAccount(User user, String code)
    {
        String email = "Hi [name],\n" +
                "\n" +
                "<br><br>There was a request to change your password!\n" +
                "\n" +
                "<br>If you did not make this request then please ignore this email.\n" +
                "\n" +
                "<br>Otherwise, please click this link to change your password: [link]";

        email = email.replace("[name]", user.getLastname());
        email = email.replace("[link]", "http://localhost:8080/OnlineAutionHCMUTE/Account/ResetPassword?userID=" + user.getId() + "&code=" + code);

        return email;
    }

    public static String TemplateChangeEmailNotification(User user, String newEmail)
    {
        String message = "Hi [name],\n" +
                "\n" +
                "chúng tôi nhận được yêu cầu đổi từ email [emailcurrent] đến email mới có địa chỉ là [emailnew].\n" +
                "Nếu đúng hãy nhấp vào đường liên kết này [link].";

        message = message.replace("[name]", user.getLastname());
        message = message.replace("[emailcurrent]", user.getEmail());
        message = message.replace("[emailnew]", newEmail);
        message = message.replace("[link]", "http://localhost:8080/OnlineAutionHCMUTE/Account/ConfirmChangeEmail?userID=" + user.getId() + "&hash=" + "hashne");
        return message;
    }
}
