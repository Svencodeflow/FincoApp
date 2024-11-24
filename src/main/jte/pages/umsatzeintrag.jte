@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param String username = ""
@param String email = null
@param Collection<? extends GrantedAuthority> authorities = null
@param CsrfHiddenInput csrfHiddenInput

@template.layout.main(
content = @`
    <style>
        .hover-text-gradient {
            position: relative;
            color: white;
            text-decoration: none;
            background: linear-gradient(to right, rgba(0, 252, 255, 1) 50%, rgba(255, 255, 255, 0.8) 50%);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            transition: background-position 0.25s ease-out;
            background-size: 200% 100%;
            background-position: 100% 0;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            border-radius: 20px;
            padding: 5px 10px;
        }

        .hover-text-gradient:hover {
            background-position: 0 0;
        }
    </style>
    <div class="min-h-screen bg-gray-900 text-white">
        <nav class="bg-gray-800 shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <h1 class="text-xl font-semibold">Umsatzeintrag</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-gray-300">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-gray-400 text-sm">${email}</span>
                        @endif
                        <form action="/dashboard" method="get">
                            ${csrfHiddenInput}
                            <button type="submit"
                                    class="px-4 py-2 text-white rounded-md hover:bg-red-700 hover-text-gradient">
                                Dashboard
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="bg-gray-800 shadow rounded-lg p-6 mt-6 text-center">
                <h2 class="text-2xl font-semibold text-white mb-4">Neuen Umsatz hinzufügen</h2>
                <div class="space-y-4">
                    <div>
                        <p class="text-sm font-medium text-gray-500">Username</p>
                        <p class="mt-1 text-lg text-gray-900">${username}</p>
                    </div>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Roles</p>
                        <div class="mt-1 flex flex-wrap gap-2">
                            <!-- Roles will be displayed here -->
                        </div>
                    </div>
                    <h1>Neuen Umsatz Eintragen</h1>
                            <form action="/umsatz" method="post" class="space-y-4">
                                <div>
                                    <label for="umsatzid" class="block text-sm font-medium text-gray-300">Umsatz-ID:</label>
                                    <input type="number" id="umsatzid" name="umsatzid" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="betrag" class="block text-sm font-medium text-gray-300">Betrag:</label>
                                    <input type="number" step="0.01" id="betrag" name="betrag" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="datum" class="block text-sm font-medium text-gray-300">Datum:</label>
                                    <input type="date" id="datum" name="datum" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="kategorieid" class="block text-sm font-medium text-gray-300">Kategorie-ID:</label>
                                    <input type="number" id="kategorieid" name="kategorieid" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="beschreibung" class="block text-sm font-medium text-gray-300">Beschreibung:</label>
                                    <input type="text" id="beschreibung" name="beschreibung" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="kdnr" class="block text-sm font-medium text-gray-300">Kundennummer:</label>
                                    <input type="text" id="kdnr" name="kdnr" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="useriban" class="block text-sm font-medium text-gray-300">IBAN:</label>
                                    <input type="text" id="useriban" name="useriban" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="art" class="block text-sm font-medium text-gray-300">Art:</label>
                                    <input type="text" id="art" name="art" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <label for="kundenreferenz" class="block text-sm font-medium text-gray-300">Kundenreferenz:</label>
                                    <input type="text" id="kundenreferenz" name="kundenreferenz" class="mt-1 block w-full bg-gray-800 text-white border border-gray-600 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                </div>

                                <div>
                                    <!--<button type="submit" class="w-1/4 px-4 py-2 text-white rounded-md hover:bg-red-700 hover-text-gradient" style="">Eintragen</button>-->
                                    <button type="submit" class="hover-text-gradient w-1/4">Eintragen</button>
                                </div>
                            </form>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Email</p>
                        <p class="mt-1 text-lg text-gray-900">${email}</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
`)