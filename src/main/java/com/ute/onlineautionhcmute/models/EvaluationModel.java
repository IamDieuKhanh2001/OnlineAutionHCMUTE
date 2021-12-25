package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Evaluation;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.beans.User;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;
import org.sql2o.data.Table;

import java.util.List;

public class EvaluationModel {

    public static List<Evaluation> findAllEvaluationByUserID(int userID) {
        final String query = "select * from evaluation where user_id = :userID";
        try (Connection con = DbUtils.getConnection()) {
            List<Evaluation> list = con.createQuery(query)
                    .addParameter("userID", userID)
                    .executeAndFetch(Evaluation.class);
            return list;
        }
    }
    public static List<Evaluation> findLikeEvaluationByUserID(int userID) {
        final String query = "select * from evaluation where user_id = :userID and type = :type";
        try (Connection con = DbUtils.getConnection()) {
            List<Evaluation> list = con.createQuery(query)
                    .addParameter("userID", userID)
                    .addParameter("type", "like")
                    .executeAndFetch(Evaluation.class);
            return list;
        }
    }
    public static void add(Evaluation evaluation)
    {
        final String query = "INSERT INTO `evaluation` (`product_id` ,`assessor`, `user_id`, `type`, `comment`) VALUES (:productID, :assessor, :user_id, :type, :comment)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("productID", evaluation.getProduct_id())
                    .addParameter("assessor", evaluation.getAssessor())
                    .addParameter("user_id", evaluation.getUser_id())
                    .addParameter("type", evaluation.getType())
                    .addParameter("comment", evaluation.getComment())
                    .executeUpdate();
        }
    }

    public static void delete(int evaluationID)
    {
        final String query = "DELETE FROM `evaluation` WHERE `id` = :evaluationID";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
                    .addParameter("evaluationID", evaluationID)
                    .executeUpdate();
        }
    }

    public static Evaluation findByAssessorAndProductID(int assessor, int productID)
    {
        final String query = "SELECT * FROM `evaluation` WHERE `assessor` = :assessor AND `product_id` = :productID";
        try (Connection connection = DbUtils.getConnection())
        {
            List<Evaluation> list = connection.createQuery(query)
                    .addParameter("assessor", assessor)
                    .addParameter("productID", productID)
                    .executeAndFetch(Evaluation.class);
            if(list.size() == 0)
                return null;
            return list.get(0);
        }
    }

    public static int countByStatus(User user, String type)
    {
        final String query = "SELECT COUNT(`id`) AS `total` FROM `evaluation` WHERE `user_id` = :userID AND `type` = :type";
        try (Connection connection = DbUtils.getConnection())
        {
            Table table = connection.createQuery(query)
                    .addParameter("userID", user.getId())
                    .addParameter("type", type)
                    .executeAndFetchTable();
            return table.rows().size();
        }
    }
}
