@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection

@import java.util.List
@import de.sic.finco.fincowebapp.CsrfHiddenInput
@import de.sic.finco.fincowebapp.BankCard

@param List<BankCard> bankCards

@template.layout.main(content = @`
    <div class="container mx-auto p-4">
        <h1 class="text-2xl font-bold mb-4">Willkommen zurück, JohnDoe</h1>
        <nav class="mb-8">
            <ul class="space-y-4">
                <li><a href="/wallet" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Mein Wallet</a></li>
            </ul>
        </nav>
    </div>

    <main class="container mx-auto p-4">
        <section class="mb-8">
            <h2 class="text-xl font-semibold mb-4">Bankkarte hinzufügen</h2>
            <form id="cardForm" action="/add-card" method="post">
                <input type="hidden" name="csrf_token" value="{{ csrf_token }}"></form>
                <div>
                    <label for="cardNumber" class="block text-sm font-medium text-gray-700">Kartennummer:</label>
                    <input type="text" id="cardNumber" name="cardNumber" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <label for="expiryDate" class="block text-sm font-medium text-gray-700">Ablaufdatum:</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <label for="cardHolderName" class="block text-sm font-medium text-gray-700">Karteninhabername:</label>
                    <input type="text" id="cardHolderName" name="cardHolderName" required class="mt-1 p-2 block w-full border rounded-md"/>
                </div>
                <div>
                    <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Hinzufügen</button>
                </div>
        </section>
        <section id="cardForm" class="mb-8">
            <h2 class="text-xl font-semibold mb-4">Deine Bankkarten</h2>
            <ul id="cardList">
                <!-- Hier werden die hinzugefügten Karten angezeigt -->
                @for(BankCard card : bankCards)
                    <li class="border p-4 mb-4 rounded">
                        <p><strong>Kartennummer:</strong> ${card.getCardNumber()}</p>
                        <p><strong>Ablaufdatum:</strong> ${card.getExpiryDate()}</p>
                        <p><strong>Karteninhabername:</strong> ${card.getCardHolderName()}</p>
                    </li>
                @endfor
            </ul>
        </section>
    </main>

    <footer class="bg-gray-100 py-4">
        <nav class="container mx-auto">
            <ul class="flex space-x-4 justify-center"> <!--Images müssen noch geändert werden -->
                <li><a href="/"><img src="/images/backFoto.jpeg" alt="Home" class="w-10 h-10"/></a></li>
            </ul>
        </nav>
    </footer>
    <script>
        document.getElementById('cardForm').addEventListener('submit', (event) => {
            event.preventDefault();

            // Sende das Formular per AJAX oder Fetch API an den Server
            fetch('/add-card', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: 1
        1. github.com
        github.com
         cardHolderName
                })
            })
            .then(response => response.json())
            .then(data => {
                // Handle the server response
                if (data.success) {
                    // Füge die neue Karte zur Liste hinzu
                    // ... (Code zum Hinzufügen der Karte) ...
                } else {
                    // Zeige eine Fehlermeldung an
                    console.error('Fehler beim Hinzufügen der Karte:', data.error);
                }
            })
            .catch(error => {
                console.error('Fehler beim Senden der Anfrage:', error);
            });
        });
    </script>
`)