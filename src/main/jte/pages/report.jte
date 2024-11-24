@param String username = ""
@param String email = null
@param java.util.Collection<? extends org.springframework.security.core.GrantedAuthority> authorities = null
@param de.sic.finco.fincowebapp.CsrfHiddenInput csrfHiddenInput
@param java.util.List<de.sic.finco.fincowebapp.Umsatz> sortedUmsaetze
@param double balance
@param String currentDate

@template.layout.main(content = @`
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
    <div class="min-h-screen bg-gray-900">
        <nav class="bg-gray-800 shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <h1 class="text-xl font-semibold">Report</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-white">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-gray-500 text-sm">${email}</span>
                        @endif
                        <form action="/dashboard" method="post">
                            ${csrfHiddenInput}
                            <button type="button" onclick="showDa()" class="hover-text-gradient">Dashboard</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>

        <main class="bg-gray-900 max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="px-4 py-6 sm:px-0">
                <div class="bg-gray-900 shadow rounded-lg p-6">
                    <h2 class="text-2xl font-semibold text-purple-600 mb-4">Finanzübersicht</h2>
                    @if(sortedUmsaetze.isEmpty())
                        <p style="color: red;">Keine Einträge vorhanden!</p>
                    @else
                        <table class="min-w-full bg-gray-900">
                            <div class="text-s font-medium ${(balance >= 0) ? "text-green-600" : "text-red-600"}"> <span class="text-white">Total (€):</span> ${balance}</div>
                            <div class="text-xs font-small text-white">Stand: ${currentDate}</div>
                            <thead>
                            <tr>
                                <th class="text-sm font-medium text-white">Verwendungszweck</th>
                                <th class="text-sm font-medium text-white">Datum</th>
                                <th class="text-sm font-medium text-white">Betrag (€)</th>
                            </tr>
                            </thead>
                            <tbody>
                            @for(de.sic.finco.fincowebapp.Umsatz umsatz : sortedUmsaetze)
                                <tr>
                                    <td class="border px-4 py-2 text-sm font-medium text-white">${umsatz.getBeschreibung()}</td>
                                    <td class="border px-4 py-2 text-sm font-medium text-white">${umsatz.getDatum().toString()}</td>
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

    <script>
        function showDa() {
            window.location.href = "/dashboard";
        }
    </script>
`)


