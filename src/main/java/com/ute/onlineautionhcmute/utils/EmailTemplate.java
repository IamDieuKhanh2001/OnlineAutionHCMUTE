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
}
