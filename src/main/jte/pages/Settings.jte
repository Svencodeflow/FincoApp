@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput
@import de.sic.finco.fincowebapp.Settings


@template.layout.main(content = @`
    <div class="container mx-auto p-4">
        <h1 class="text-3xl font-bold mb-6">Einstellungen</h1>
        <!-- Modes Section -->
        <section class="mb-8">
            <h2 class="text-2xl font-semibold mb-4">Modi</h2>
            <div class="flex items-center mb-4">
                <label for="darkMode" class="block text-sm font-medium text-gray-700 mr-2">Dunkelmodus:</label>
                <input type="checkbox" id="darkMode" name="darkMode" class="h-4 w-4 text-blue-600 border-gray-300 rounded">
            </div>
            <div class="flex items-center mb-4">
                <label for="lightMode" class="block text-sm font-medium text-gray-700 mr-2">Hellmodus:</label>
                <input type="checkbox" id="lightMode" name="lightMode" class="h-4 w-4 text-blue-600 border-gray-300 rounded">
            </div>
        </section>
        <!-- Profile Section -->
        <section class="mb-8">
            <h2 class="text-2xl font-semibold mb-4">Profil</h2>
            <form class="space-y-4">
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700">Benutzername:</label>
                    <input type="text" id="username" name="username" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">E-Mail:</label>
                    <input type="email" id="email" name="email" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Speichern</button>
                </div>
            </form>
        </section>
        <!-- Languages Section -->
        <section class="mb-8">
            <h2 class="text-2xl font-semibold mb-4">Sprachen</h2>
            <form class="space-y-4">
                <div>
                    <label for="language" class="block text-sm font-medium text-gray-700">Sprache:</label>
                    <select id="language" name="language" class="mt-1 p-2 block w-full border rounded-md">
                        <option value="de">Deutsch</option>
                        <option value="en">Englisch</option>
                        <option value="fr">Französisch</option>
                        <option value="es">Spanisch</option>
                    </select>
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Speichern</button>
                </div>
            </form>
        </section>
    </div>

    <script>
        document.getElementById('darkMode').addEventListener('change', function(event) {
            if (event.target.checked) {
                document.body.classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
            }
        });
    </script>

`)