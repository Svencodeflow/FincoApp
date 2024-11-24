@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput

@template.layout.main(content = @`
    <style>
        /* Zusätzliche benutzerdefinierte CSS-Stile */
        .faq-question {
            cursor: pointer;
        }
        .faq-answer {
            display: none;
        }
        img.logo {
            width: 50px;
            height: 50px;
        }
    </style>
    <div class="container mx-auto p-4">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-3xl font-bold mb-6">Häufig gestellte Fragen (FAQ)</h1>
            <img src="/images/logo.png" alt="Logo" class="logo">
        </div>
        <div class="faq-item mb-4">
            <div class="faq-question text-xl font-semibold text-gray-700 bg-gray-200 p-4 rounded" onclick="toggleAnswer(this)">Was ist Finco?</div>
            <div class="faq-answer text-gray-700 bg-white p-4 rounded mt-2">
                Finco ist eine innovative Finanzplattform, die Ihnen hilft, Ihre finanziellen Transaktionen sicher und effizient zu verwalten.
            </div>
        </div>
        <div class="faq-item mb-4">
            <div class="faq-question text-xl font-semibold text-gray-700 bg-gray-200 p-4 rounded" onclick="toggleAnswer(this)">Wie kann ich mein Konto erstellen?</div>
            <div class="faq-answer text-gray-700 bg-white p-4 rounded mt-2">
                Klicken Sie auf die Schaltfläche "Registrieren" auf unserer Startseite und folgen Sie den Anweisungen, um Ihr Konto zu erstellen.
            </div>
        </div>
        <div class="faq-item mb-4">
            <div class="faq-question text-xl font-semibold text-gray-700 bg-gray-200 p-4 rounded" onclick="toggleAnswer(this)">Wie schütze ich mein Konto?</div>
            <div class="faq-answer text-gray-700 bg-white p-4 rounded mt-2">
                Verwenden Sie ein starkes Passwort, aktivieren Sie die Zwei-Faktor-Authentifizierung und teilen Sie Ihre Zugangsdaten nicht mit anderen.
            </div>
        </div>
        <div class="faq-item mb-4">
            <div class="faq-question text-xl font-semibold text-gray-700 bg-gray-200 p-4 rounded" onclick="toggleAnswer(this)">Wie kann ich Unterstützung erhalten?</div>
            <div class="faq-answer text-gray-700 bg-white p-4 rounded mt-2">
                Sie können uns jederzeit über das Kontaktformular auf unserer Website oder telefonisch unter der angegebenen Nummer erreichen.
            </div>
        </div>
    </div>

    <footer class="bg-cover bg-center py-4" style="background-image: url('/images/backFoto.jpeg');">
        <nav class="container mx-auto flex justify-center items-center">
            <div class="text-center">
                <a href="/temp_kat" class="bg-cyan-500 text-white py-2 px-4 rounded">Zurück zur Übersicht</a>
                <a href="/dashboard" class="bg-cyan-500 text-white py-2 px-4 rounded ml-4">Zum Dashboard</a>
            </div>
        </nav>
    </footer>

    <script>
        function toggleAnswer(element) {
            const answer = element.nextElementSibling;
            if (answer.style.display === "none" || answer.style.display === "") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
`)
