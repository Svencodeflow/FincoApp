@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection

@import java.util.List
@import de.sic.finco.fincowebapp.CsrfHiddenInput
@import de.sic.finco.fincowebapp.BankCard
@import de.sic.finco.fincowebapp.BankCardService

@param List<BankCard> bankCards
@param String username

@template.layout.main(content = @`
    <style> /* Zusätzliche benutzerdefinierte CSS-Stile */
    input[type="text"], input[type="password"] {
     color: black; /* Textfarbe auf Schwarz setzen */
     border-color: gray; /* Randfarbe auf Grau setzen */
     }
    </style>

<div class="container mx-auto p-4">
    <h1 class="text-2xl font-bold mb-4">Willkommen zurück, <span>${username}</span></h1>
    <nav class="mb-8">
        <ul class="space-y-4">
            <li><a href="/wallet" class="bg-blue-500 text-white py-2 px-4 rounded block text-center">Mein Wallet</a></li>
        </ul>
    </nav>
</div>

<main class="container mx-auto p-4">
    <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Bankkarte hinzufügen</h2>
        <form id="cardForm">
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
                <button type="submit" class="bg-blue-500 text-black py-2 px-4 rounded">Hinzufügen</button>
            </div>
        </form>
    </section>
    <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Deine Bankkarten</h2>
        <ul id="cardList">
            <!-- Hier werden die hinzugefügten Karten angezeigt -->
            <li class="border p-4 mb-4 rounded" id="cardTemplate" style="display: none;">
                <p><strong>Kartennummer:</strong> <span class="cardNumber"></span></p>
                <p><strong>Ablaufdatum:</strong> <span class="expiryDate"></span></p>
                <p><strong>Karteninhabername:</strong> <span class="cardHolderName"></span></p>
            </li>
        </ul>
    </section>
</main>

<footer class="bg-gray-100 py-4">
    <nav class="container mx-auto">
        <div class="flex justify-center">
            <button onclick="history.back()" class="bg-blue-500 text-white py-2 px-4 rounded">Zurück</button>
        </div>
    </nav>
</footer>

<script>
    document.getElementById('cardForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const cardNumber = document.getElementById('cardNumber').value;
        const expiryDate = document.getElementById('expiryDate').value;
        const cardHolderName = document.getElementById('cardHolderName').value;

        // Sende die Daten an den Server
        fetch('/add-card', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Erstelle eine Kopie des Templates und füge die Daten hinzu
                const newCard = document.getElementById('cardTemplate').cloneNode(true);
                newCard.style.display = 'block';
                newCard.querySelector('.cardNumber').textContent = cardNumber;
                newCard.querySelector('.expiryDate').textContent = expiryDate;
                newCard.querySelector('.cardHolderName').textContent = cardHolderName;

                // Füge die neue Karte zur Liste hinzu
                document.getElementById('cardList').appendChild(newCard);

                // Formular zurücksetzen
                document.getElementById('cardForm').reset();
            } else {
                console.error('Fehler beim Hinzufügen der Karte:', data.error);
            }
        })
        .catch(error => {
            console.error('Fehler beim Senden der Anfrage:', error);
        });
    });

</script>
`)