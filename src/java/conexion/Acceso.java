package conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Acceso {

    public static Connection getConexion() {
        Connection cn;
        try {
            String url = "jdbc:mysql://utytcahyubdxki60:FiQ7QiHxHDqywNL14LlB@bhdvpkp5ipt7tlpmznry-mysql.services.clever-cloud.com:3306/bhdvpkp5ipt7tlpmznry";
            String user = "utytcahyubdxki60";
            String password = "FiQ7QiHxHDqywNL14LlB";

            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, password);

            System.out.println("Conexión exitosa");
       } catch (ClassNotFoundException e) {
            System.err.println("Driver JDBC no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error SQL al conectar: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error general: " + e.getMessage());
        }
        return cn;
    }
    }

    public static String ejecutar(String sql) {
        String msg = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                msg = "No hay Conexion con la Base de Datos";
            } else {
                Statement st = cn.createStatement();
                st.executeUpdate(sql);
                cn.close();
            }
        } catch (SQLException e) {
            msg = e.getMessage();
        }
        return msg;
    }

    public static List listar(String sql) {
        List lista = new ArrayList();
        try {
            Connection cn = getConexion();
            if (cn == null) {
                lista = null;
            } else {
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                ResultSetMetaData rm = rs.getMetaData();
                int numCol = rm.getColumnCount();
                while (rs.next()) {
                    Object[] fila = new Object[numCol];
                    for (int i = 0; i < numCol; i++) {
                        fila[i] = rs.getObject(i + 1);
                    }
                    lista.add(fila);
                }
                cn.close();
            }
        } catch (SQLException e) {
            lista = null;
        }
        return lista;
    }

    public static Object[] buscar(String sql) {
        Object[] fila = null;
        List lista = listar(sql);
        if (lista != null) {
            for (int i = 0; i < lista.size(); i++) {
                fila = (Object[]) lista.get(i);
            }
        }
        return fila;
    }

    public static String getNum(String sql) {
        String numGen;
        String numObt = null;
        try {
            Connection cn = getConexion();
            if (cn == null) {
                numGen = null;
            } else {
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    numObt = rs.getString(1);
                }
                String parInt = numObt.substring(2);
                String parStr = numObt.substring(0, 1);
                String nueParInt = String.valueOf(Integer.parseInt(parInt) + 1);
                while (nueParInt.length() < 5) {
                    nueParInt = "0" + nueParInt;
                }
                numGen = parStr + nueParInt;
            }
        } catch (SQLException e) {
            numGen = null;
        }
        return numGen;
    }

}
