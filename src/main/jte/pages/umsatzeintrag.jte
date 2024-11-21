@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param String username = ""
@param String email = null
@param Collection<? extends GrantedAuthority> authorities = null
@param CsrfHiddenInput csrfHiddenInput

@template.layout.main(
content = @`
    <div class="min-h-screen bg-gray-100">
        <nav class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <h1 class="text-xl font-semibold">Dashboard</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-gray-700">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-gray-500 text-sm">${email}</span>
                        @endif
                        <form action="/logout" method="post">
                            ${csrfHiddenInput}
                            <button type="submit"
                                    class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
                                Logout
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="px-4 py-6 sm:px-0">
                <div class="bg-white shadow rounded-lg p-6">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Neuen Umsatz hinzufügen</h2>
                    <div class="space-y-4">
                        <div>
                            <p class="text-sm font-medium text-gray-500">Username</p>
                            <p class="mt-1 text-lg text-gray-900">${username}</p>
                        </div>

                            <div>
                                <p class="text-sm font-medium text-gray-500">Roles</p>
                                <div class="mt-1 flex flex-wrap gap-2">

                                </div>
                            </div>
                        <h1>Neuen Umsatz Eintragen</h1>
                        <form action="/api/umsatz" method="post">
                            <label for="umsatzid">Umsatz-ID:</label>
                            <input type="number" id="umsatzid" name="umsatzid" required>

                            <label for="betrag">Betrag:</label>
                            <input type="number" step="0.01" id="betrag" name="betrag" required>

                            <label for="datum">Datum:</label>
                            <input type="date" id="datum" name="datum" required>

                            <label for="kategorieid">Kategorie-ID:</label>
                            <input type="number" id="kategorieid" name="kategorieid" required>

                            <label for="beschreibung">Beschreibung:</label>
                            <input type="text" id="beschreibung" name="beschreibung" required>

                            <label for="kdnr">Kundennummer:</label>
                            <input type="text" id="kdnr" name="kdnr" required>

                            <label for="useriban">IBAN:</label>
                            <input type="text" id="useriban" name="useriban" required>

                            <label for="art">Art:</label>
                            <input type="text" id="art" name="art" required>

                            <label for="kundenreferenz">Kundenreferenz:</label>
                            <input type="text" id="kundenreferenz" name="kundenreferenz" required>

                            <!-- <label for="ausgabelimit">Ausgabelimit:</label>
                            <input type="number" step="0.01" id="ausgabelimit" name="ausgabelimit"> -->

                            <button type="submit">Eintragen</button>
                        </form>

                            <div>
                                <p class="text-sm font-medium text-gray-500">Email</p>
                                <p class="mt-1 text-lg text-gray-900">${email}</p>
                            </div>

                    </div>
                </div>
            </div>
        </main>
    </div>
`)
