
package presentador;

import java.util.ArrayList;
import java.util.List;

public class PresDetallePedido {
    private List lis=new ArrayList();
    private Object[]fil={"","","","","","","",""};
    private String subTot="";
    private String igv="";
    private String tot="";

    public PresDetallePedido() {
        lis.add(fil);
    }

    public List getLis() {
        return lis;
    }

    public void setLis(List lis) {
        this.lis = lis;
    }

    public Object[] getFil() {
        return fil;
    }

    public void setFil(Object[] fil) {
        this.fil = fil;
    }

    public String getSubTot() {
        return subTot;
    }

    public void setSubTot(String subTot) {
        this.subTot = subTot;
    }

    public String getIgv() {
        return igv;
    }

    public void setIgv(String igv) {
        this.igv = igv;
    }
    
    public String getTot() {
        return tot;
    }

    public void setTot(String tot) {
        this.tot = tot;
    }

    @Override
    public String toString() {
        return "PresDetallePedido{" + "lis=" + lis + ", fil=" + fil + ", subTot=" + subTot + ", igv=" + igv + ", tot=" + tot + '}';
    }
    
    
}
