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
                                    label: '',
                                    data: data,
                                    borderColor: 'rgba(45, 188, 179, 0.71)',
                                    backgroundColor: 'rgba(18, 142, 142, 0.2)',
                                    borderWidth: 6,
                                    fill: true,
                                    cubicInterpolationMode: 'monotone',           //abrundung der übergänge von punkt zu punkt
                                    pointRadius: false

                                }]
                            },
                            options: {
                                    responsive: true,
                                scales: {
                                    x: {
                                        grid:{
                                            beginAtZero: true
                                            }
                                        },
                                    y: {
                                        grid:{
                                            color: 'rgba(58, 201, 197, 1)',
                                            borderColor: 'grey',
                                            tickColor: 'grey',
                                            beginAtZero: true
                                            }
                                        }
                                    },
                                        plugins: {
                                            legend: {
                                                display: false                         // Legende deaktivieren
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
