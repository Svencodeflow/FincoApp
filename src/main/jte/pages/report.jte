@param String username = ""
@param String email = null
@param java.util.Collection<? extends org.springframework.security.core.GrantedAuthority> authorities = null
@param de.sic.finco.fincowebapp.CsrfHiddenInput csrfHiddenInput
@param java.util.List<de.sic.finco.fincowebapp.Umsatz> sortedUmsaetze
@param double balance
@param String currentDate

@template.layout.main(content = @`
    <div class="min-h-screen bg-gray-100">
        <nav class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <h1 class="text-xl font-semibold">Report</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-sm font-medium text-gray-500">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-gray-500 text-sm">${email}</span>
                        @endif
                        <form action="/logout" method="post">
                            ${csrfHiddenInput}
                            <button type="submit" class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
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
                    <h2 class="text-2xl font-semibold text-purple-600 mb-4">Finanzübersicht</h2>
                    @if(sortedUmsaetze.isEmpty())
                        <p style="color: red;">Keine Einträge vorhanden!</p>
                    @else
                        <table class="min-w-full bg-white">
                            <div class="text-s font-medium ${(balance >= 0) ? "text-green-600" : "text-red-600"}"> <span class="text-gray-800">Total (€):</span> ${balance}</div>
                            <div class="text-xs font-small text-gray-400">Stand: ${currentDate}</div>
                            <thead>
                            <tr>
                                <th class="text-sm font-medium text-purple-500">Verwendungszweck</th>
                                <th class="text-sm font-medium text-purple-500">Datum</th>
                                <th class="text-sm font-medium text-purple-500">Betrag (€)</th>
                            </tr>
                            </thead>
                            <tbody>
                            @for(de.sic.finco.fincowebapp.Umsatz umsatz : sortedUmsaetze)
                                <tr>
                                    <td class="border px-4 py-2 text-sm font-medium text-gray-500">${umsatz.getBeschreibung()}</td>
                                    <td class="border px-4 py-2 text-sm font-medium text-gray-500">${umsatz.getDatum().toString()}</td>
                                    <td class="border px-4 py-2 text-sm font-medium ${(umsatz.getBetrag() >= 0) ? "text-green-600" : "text-red-600"}">${umsatz.getBetrag()}</td>
                                </tr>
                            @endfor
                            </tbody>
                        </table>
                    @endif
                </div>
            </div>
        </main>
    </div>
`)


