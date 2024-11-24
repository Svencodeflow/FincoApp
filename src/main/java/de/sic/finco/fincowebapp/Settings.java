package de.sic.finco.fincowebapp;

public class Settings {
    private boolean darkMode;
    private String username;
    private String email;
    private String language;

    public Settings(boolean darkMode, String username, String email, String language) {
         this.darkMode = darkMode;
         this.username = username;
         this.email = email;
         this.language = language;

        }

        public boolean isDarkMode() {
            return darkMode;
        }

        public void setDarkMode(boolean darkMode) {
            this.darkMode = darkMode;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getLanguage() {
            return language;
        }

        public void setLanguage(String language) {
            this.language = language;
        }
}

