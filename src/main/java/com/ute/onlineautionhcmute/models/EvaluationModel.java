package com.ute.onlineautionhcmute.models;

import com.ute.onlineautionhcmute.beans.Evaluation;
import com.ute.onlineautionhcmute.utils.DbUtils;
import org.sql2o.Connection;

public class EvaluationModel {
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
