package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("login")
public class Login{
    @Id
    @NotNull
    private int loginid;
    @NotNull
    private int userid;
    @NotNull
    private String kdnr;
    @NotNull
    private String useriban;
    @NotNull
    private LocalDateTime loginzeit;
    @NotNull
    private String ipadresse;
    @NotNull
    private String status;

    public Login() {

    }

    public int getLoginid() {
        return loginid;
    }

    public void setLoginid(int loginid) {
        this.loginid = loginid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getKdnr() {
        return kdnr;
    }

    public void setKdnr(String kdnr) {
        this.kdnr = kdnr;
    }

    public String getUseriban() {
        return useriban;
    }

    public void setUseriban(String useriban) {
        this.useriban=useriban;
    }

    public LocalDateTime getLoginzeit() {
        return loginzeit;
    }

    public void setLoginzeit(LocalDateTime loginzeit) {
        this.loginzeit = loginzeit;
    }

    public String getIpadresse() {
        return ipadresse;
    }

    public void setIpadresse(String ipadresse) {
        this.ipadresse = ipadresse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
