package entidad;

import java.util.List;

public class Pedido {

    private String numPedido;
    private String codUsuario;
    private String codCliente;
    private String fec;
    private List ped;

    public Pedido(String numPedido, String codUsuario, String codCliente, String fec, List ped) {
        this.numPedido = numPedido;
        this.codUsuario = codUsuario;
        this.codCliente = codCliente;
        this.fec = fec;
        this.ped = ped;
    }

    public Pedido(String numPedido, String codUsuario, String codCliente, String fec) {
        this.numPedido = numPedido;
        this.codUsuario = codUsuario;
        this.codCliente = codCliente;
        this.fec = fec;
    }

    public Pedido(String numPedido, List ped) {
        this.numPedido = numPedido;
        this.ped = ped;
    }

    public Pedido() {
    }

    public String getNumPedido() {
        return numPedido;
    }

    public void setNumPedido(String numPedido) {
        this.numPedido = numPedido;
    }

    public String getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(String codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(String codCliente) {
        this.codCliente = codCliente;
    }

    public String getFec() {
        return fec;
    }

    public void setFec(String fec) {
        this.fec = fec;
    }

    public List getPed() {
        return ped;
    }

    public void setPed(List ped) {
        this.ped = ped;
    }

}
