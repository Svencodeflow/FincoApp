package de.sic.finco.fincowebapp;

import jakarta.validation.constraints.NotNull;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("login")
public class Login{

    @Id
    @NotNull
    private int login_id;
    @NotNull
    private String kdnr;
    @NotNull
    private String useriban;
    @NotNull
    private LocalDateTime loginzeit;
    @NotNull
    private String ip_adresse;
    @NotNull
    private String status;

    public Login() {

    }

    public int getLoginid() {
        return login_id;
    }

    public void setLoginid(int login_id) {
        this.login_id = login_id;
    }

    public String getKdnr() {
        return kdnr;
    }

    public void setKdnr(String kdnr) {
        this.kdnr = kdnr;
    }

    public String getIban() {
        return useriban;
    }

    public void setIban(String useriban) {
        this.useriban=useriban;
    }

    public LocalDateTime getLoginzeit() {
        return loginzeit;
    }

    public void setLoginzeit(LocalDateTime loginzeit) {
        this.loginzeit = loginzeit;
    }

    public String getIpadresse() {
        return ip_adresse;
    }

    public void setIpadresse(String ip_adresse) {
        this.ip_adresse = ip_adresse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
