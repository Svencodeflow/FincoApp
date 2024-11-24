@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param String username

@template.layout.main(content = @`
    <div class="container mx-auto p-4">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-2xl font-bold mb-4">Willkommen zurück, <span>${username}</span></h1>
            <img src="/images/logo.png" alt="Logo" class="w-16 h-16">
        </div>
        <nav class="mb-8">
            <ul class="space-y-4">
                <li><a href="/wallet" class="bg-cyan-500 text-white py-2 px-4 rounded block text-center">Mein Wallet</a></li>
                <li><a href="/settings" class="bg-cyan-500 text-white py-2 px-4 rounded block text-center">Einstellungen</a></li>
                <li><a href="/faq" class="bg-cyan-500 text-white py-2 px-4 rounded block text-center">FAQ</a></li>
                <li><a href="/logout" class="bg-cyan-500 text-white py-2 px-4 rounded block text-center">Abmelden</a></li>
            </ul>
        </nav>
    </div>

    <main class="container mx-auto p-4">
        <section class="mb-8">
            <h2 class="text-xl font-semibold mb-4">Benachrichtigungen</h2>
            <div class="flex items-center mb-4">
                <label for="notifications" class="block text-sm font-medium text-gray-700 mr-2">Aktiviere Benachrichtigungen:</label>
                <input type="checkbox" id="notifications" name="notifications" class="h-4 w-4 text-blue-600 border-gray-300 rounded">
            </div>
        </section>
    </main>

    <footer class="bg-cover bg-center py-4" style="background-image: url('/images/backFoto.jpeg');">
        <nav class="container mx-auto flex justify-center items-center">
            <div class="text-center">
                <a href="/temp_kat" class="bg-cyan-500 text-white py-2 px-4 rounded">Zurück zur Übersicht</a>
                <a href="/dashboard" class="bg-cyan-500 text-white py-2 px-4 rounded ml-4">Zum Dashboard</a>
            </div>
        </nav>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const notificationCheckbox = document.getElementById('notifications');

            //! Laden des gespeicherten Zustands der Benachrichtigungen
            const notificationsEnabled = localStorage.getItem('notificationsEnabled') === 'true';
            notificationCheckbox.checked = notificationsEnabled;

            notificationCheckbox.addEventListener('change', function(event) {
                if (event.target.checked) {
                    if (Notification.permission === 'granted') {
                        new Notification('Benachrichtigungen sind aktiviert!');
                    } else if (Notification.permission !== 'denied') {
                        Notification.requestPermission().then(permission => {
                            if (permission === 'granted') {
                                new Notification('Benachrichtigungen sind aktiviert!');
                            }
                        });
                    }
                    localStorage.setItem('notificationsEnabled', 'true');
                } else {
                    //! Logik zum Deaktivieren von Benachrichtigungen (falls erforderlich)
                    alert('Benachrichtigungen sind deaktiviert!');
                    localStorage.setItem('notificationsEnabled', 'false');
                }
            });
        });
    </script>
`)
