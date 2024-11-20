@param String username = ""
@param String email = null
@param java.util.Collection<? extends org.springframework.security.core.GrantedAuthority> authorities = null
@param de.sic.finco.fincowebapp.CsrfHiddenInput csrfHiddenInput
@param java.util.List<de.sic.finco.fincowebapp.Umsatz> sortedUmsaetze
@param java.util.List<Double> diagramAmounts

@template.layout.main(content = @`
    <div class="min-h-screen bg-gray-100">
        <nav class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between h-16">
                    <div class="flex items-center">
                        <h1 class="text-xl font-semibold">Diagram</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-gray-700">Welcome, ${username}</span>
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
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Finanzdiagramm</h2>
                    <canvas id="transactionChart" width="400" height="200"></canvas>
                    <script>

                        // Daten für das Diagramm vorbereiten
                        const labels = [
                        @for(de.sic.finco.fincowebapp.Umsatz umsatz : sortedUmsaetze)
                                '${umsatz.getDatum().toString()}',
                            @endfor
                        ];

                        const data = [
                        @for (Double amount : diagramAmounts)
                            ${amount},
                            @endfor
                        ];

                        // Konfiguration für das Diagramm
                        const config = {
                            type: 'line',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Transaktionen',
                                    data: data,
                                    borderColor: 'rgba(226, 136, 139, 0.88)',
                                    borderWidth: 1,
                                    fill: false
                                }]
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    x: {
                                        beginAtZero: true
                                    },
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        };

                        // Diagramm rendern
                        const render = document.getElementById('transactionChart').getContext('2d');
                        new Chart(render, config);
                    </script>
                </div>
            </div>
        </main>
    </div>
`)
