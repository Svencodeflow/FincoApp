@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput


@param String username = "John Wick"


@template.layout.main(content = @`
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Willkommen zurück, <span text="${username}"></span></h1>
        <nav class="mb-8">
            <ul class="space-y-4">
                <li><a href="/wallet" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Mein Wallet</a></li>
                <li><a href="/notifications" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Benachrichtigungen</a></li>
                <li><a href="/settings" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Einstellungen</a></li>
                <li><a href="/faq" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">FAQ</a></li>
                <li><a href="/logout" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Abmelden</a></li>
            </ul>
        </nav>
    </div>


  <!--  <main class="container mx-auto p-4">
        <section class="mb-8">
            <h2 class="text-xl font-semibold mb-4">Deine Transaktionen</h2>
            <form action="/add" method="post" class="space-y-4">
                <div>
                    <label for="description" class="block text-sm font-medium text-gray-700">Beschreibung:</label>
                    <input type="text" id="description" name="description" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <label for="amount" class="block text-sm font-medium text-gray-700">Betrag:</label>
                    <input type="number" step="0.01" id="amount" name="amount" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Hinzufügen</button>
                </div>
            </form>
        </section>
    </main> -->
    <footer class="bg-gray-100 py-4">
        <nav class="container mx-auto">
            <ul class="flex space-x-4 justify-center">
                <li><a href="/"><img src="/images/backFoto.jpeg" alt="Home" class="w-10 h-10"/></a></li>
            </ul>
        </nav>
    </footer>
`)