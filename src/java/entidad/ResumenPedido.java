package entidad;

import java.util.List;

/**
 *
 * @author broncake
 */
public class ResumenPedido {

    private Pedido pedido;
    private Cliente cliente;
    private List detPedido;
    private double subTotal;
    private double igv;
    private double total;

    public ResumenPedido(Pedido pedido, Cliente cliente, List detPedido, double subTotal, double igv, double total) {
        this.pedido = pedido;
        this.cliente = cliente;
        this.detPedido = detPedido;
        this.subTotal = subTotal;
        this.igv = igv;
        this.total = total;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List getDetPedido() {
        return detPedido;
    }

    public void setDetPedido(List detPedido) {
        this.detPedido = detPedido;
    }

}
