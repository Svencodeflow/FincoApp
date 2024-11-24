@param String username = ""
@param String email = null
@param java.util.Collection<? extends org.springframework.security.core.GrantedAuthority> authorities = null
@param de.sic.finco.fincowebapp.CsrfHiddenInput csrfHiddenInput
@param java.util.List<de.sic.finco.fincowebapp.Umsatz> sortedUmsaetze
@param java.util.List<Double> diagramAmounts

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
                        <h1 class="text-xl font-semibold">Diagram</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-white">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-white text-sm">${email}</span>
                        @endif
                        <form action="/logout" method="post">
                            ${csrfHiddenInput}
                            <form action="/dashboard" method="post">
                                ${csrfHiddenInput}
                                <button type="button" onclick="showDa()" class="hover-text-gradient">Dashboard</button>
                            </form>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="px-4 py-6 sm:px-0">
                <div class="bg-gray-900 shadow rounded-lg p-6">
                    <h2 class="text-2xl font-semibold text-white mb-4">Finanzdiagramm</h2>
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
                                            color: 'white',
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

                        function showDa() {
                            window.location.href = "/dashboard";
                        }

                    </script>
                </div>
            </div>
        </main>
    </div>
`)