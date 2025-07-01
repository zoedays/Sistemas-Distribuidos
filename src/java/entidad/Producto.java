
package entidad;

public class Producto {
    private String codProducto;
    private String nom;
    private String des;
    private double pre;
    private String est;

    public Producto(String codProducto, String nom, String des, double pre, String est) {
        this.codProducto = codProducto;
        this.nom = nom;
        this.des = des;
        this.pre = pre;
        this.est = est;
    }
    
    public Producto(String codProducto, String nom, String des, double pre) {
        this.codProducto = codProducto;
        this.nom = nom;
        this.des = des;
        this.pre = pre;
    }

    public Producto() {
    }
    
    public String getCodProducto() {
        return codProducto;
    }

    public void setCodProducto(String codProducto) {
        this.codProducto = codProducto;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    @Override
    public String toString() {
        return "Producto{" + "codProducto=" + codProducto + ", nom=" + nom + ", des=" + des + ", pre=" + pre + ", est=" + est + '}';
    }
    
    
}
