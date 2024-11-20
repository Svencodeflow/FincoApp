@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput


@param String username = ""
@param String email = null
@param Collection<? extends GrantedAuthority> authorities = null
@param CsrfHiddenInput csrfHiddenInput


@template.layout.main(content = @`
    <div>
        <h1>Willkommen zurück, <span text="${username}"></span></h1>
        <nav>
            <ul>
                <li><a href="/wallet">Mein Wallet</a></li>
                <li><a href="/notifications">Benachrichtigungen</a></li>
                <li><a href="/settings">Einstellungen</a></li>
                <li><a href="/faq">FAQ</a></li>
                <li><a href="/logout">Abmelden</a></li>
            </ul>
        </nav>
    </div>
    <main>
        <section>
            <h2>Deine Transaktionen</h2>
            <form action="/add" method="post">
                <label for="description">Beschreibung:</label>
                <input type="text" id="description" name="description" required/>
                <label for="amount">Betrag:</label>
                <input type="number" step="0.01" id="amount" name="amount" required/>
                <button type="submit">Hinzufügen</button>
            </form>
        </section>
        <section>
            <h2>Transaktionen</h2>
        </section>
    </main>
    <footer>
        <nav>
            <ul>
                <li><a href="/"><img src="/icons/home.svg" alt="Home"/></a></li>
                <li><a href="/wallet"><img src="/icons/wallet.svg" alt="Wallet"/></a></li>
                <li><a href="/add"><img src="/icons/add.svg" alt="Add"/></a></li>
                <li><a href="/stats"><img src="/icons/stats.svg" alt="Stats"/></a></li>
            </ul>
        </nav>
    </footer>
`)