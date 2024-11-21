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
        <form action="/add-card" method="post" class="space-y-4">
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
        </form>
    </section>
    <section class="mb-8">
        <h2 class="text-xl font-semibold mb-4">Deine Bankkarten</h2>
        <ul id="cardList">
            <!-- Hier werden die hinzugefügten Karten angezeigt -->
        </ul>
    </section>
</main>

<footer class="bg-gray-100 py-4">
    <nav class="container mx-auto">
        <ul class="flex space-x-4 justify-center">
            <li><a href="/"><img src="/images/backFoto.jpeg" alt="Home" class="w-10 h-10"/></a></li>
        </ul>
    </nav>
</footer>
`)