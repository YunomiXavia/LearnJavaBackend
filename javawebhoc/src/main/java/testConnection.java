import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.Connection;
import java.sql.SQLException;

public class testConnection {
    public static void main(String[] args) {
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser("sa"); // user
        ds.setPassword("dinhanst2832004"); // password
        ds.setServerName("DESKTOP-TPO0VA4"); // server name
        ds.setPortNumber(1433); // port tcp/ip
        ds.setDatabaseName("Building"); // db name
        ds.setTrustServerCertificate(true); // trust the server certificate

        try (Connection conn = ds.getConnection()) {
            System.out.println("Connection success!");
            System.out.println(conn.getMetaData().getDatabaseProductName());
            System.out.println(conn.getCatalog());
        } catch (SQLServerException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
