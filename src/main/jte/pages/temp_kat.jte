@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param String username

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

    <footer class="bg-gray-100 py-4">
        <nav class="container mx-auto">
            <ul class="flex space-x-4 justify-center">
                <li><a href="/"><img src="/images/backFoto.jpeg" alt="Home" class="w-10 h-10"/></a></li>
            </ul>
        </nav>
    </footer>
`)