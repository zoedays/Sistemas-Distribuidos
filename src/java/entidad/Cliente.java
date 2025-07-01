package entidad;

public class Cliente {

    private String codCliente;
    private String nom;
    private String ape;
    private String dir;
    private String dni;
    private String tel;
    private String cel;
    private String est; 

    public Cliente(String codCliente, String nom, String ape, String dir, String dni, String tel, String cel, String est) {
        this.codCliente = codCliente;
        this.nom = nom;
        this.ape = ape;
        this.dir = dir;
        this.dni = dni;
        this.tel = tel;
        this.cel = cel;
        this.est = est;
    }

    public Cliente(String codCliente, String nom, String ape, String dir, String dni, String tel, String cel) {
        this.codCliente = codCliente;
        this.nom = nom;
        this.ape = ape;
        this.dir = dir;
        this.dni = dni;
        this.tel = tel;
        this.cel = cel;
    }
    
    public Cliente() {
    }
    
    public String getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(String codCliente) {
        this.codCliente = codCliente;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCel() {
        return cel;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    @Override
    public String toString() {
        return "Cliente{" + "codCliente=" + codCliente + ", nom=" + nom + ", ape=" + ape + ", dir=" + dir + ", dni=" + dni + ", tel=" + tel + ", cel=" + cel + ", est=" + est + '}';
    }

}