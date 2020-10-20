package DB;
import java.sql.*;
import java.util.Vector;

import DB.Const;

public class DBHandler extends Configs{
    Connection dbConnection;

    public Connection getDbConnection()
            throws ClassNotFoundException, SQLException{
        String Sconnection = "jdbc:mysql://" + dbHost + ":"
                + dbPort + "/" + dbName + "?serverTimezone=UTC";
        Class.forName("com.mysql.cj.jdbc.Driver");

        dbConnection = DriverManager.getConnection(Sconnection, dbUser, dbPass);
        return dbConnection;
    }

}
