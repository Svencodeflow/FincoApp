package de.sic.finco.fincowebapp;

import org.springframework.data.annotation.Id;

import java.sql.Date;

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Size(min = 3, max = 50)
    private String username;
    private String RegNumber;
    private String name;
    private String preName;
    @Email
    @NotBlank
    private String email;
    private String gender;
    private String password;
    private String note;
    private String Ogoogle1;
    private String Ogoogle2;
    private String Iban;
    private String Bic;

    public String getRegNumber() {
        return RegNumber;
    }

    public void setRegNumber(String regNumber) {
        RegNumber = regNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPreName() {
        return preName;
    }

    public void setPreName(String preName) {
        this.preName = preName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOgoogle1() {
        return Ogoogle1;
    }

    public void setOgoogle1(String ogoogle1) {
        Ogoogle1 = ogoogle1;
    }

    public String getOgoogle2() {
        return Ogoogle2;
    }

    public void setOgoogle2(String ogoogle2) {
        Ogoogle2 = ogoogle2;
    }

    public String getIban() {
        return Iban;
    }

    public void setIban(String iban) {
        Iban = iban;
    }

    public String getBic() {
        return Bic;
    }

    public void setBic(String bic) {
        Bic = bic;
    }

    // override toString()

}
