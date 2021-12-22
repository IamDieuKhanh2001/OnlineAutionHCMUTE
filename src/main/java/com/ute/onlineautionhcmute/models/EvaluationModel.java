package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Evaluation;
import com.ute.onlineautionhcmute.beans.Product;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

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
        final String query = "INSERT INTO `evaluation` (`assessor`, `user_id`, `type`, `comment`) VALUES (:assessor, :user_id, :type, :comment)";
        try (Connection connection = DbUtils.getConnection())
        {
            connection.createQuery(query)
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

}
