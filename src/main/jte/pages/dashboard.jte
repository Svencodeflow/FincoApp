@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput


@param String username = ""
@param String email = null
@param Collection<? extends GrantedAuthority> authorities = null
@param CsrfHiddenInput csrfHiddenInput
@param java.util.List<de.sic.finco.fincowebapp.Umsatz> sortedUmsaetze
@param java.util.List<Double> diagramAmounts

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
                    <h1 class="text-xl font-semibold">Finanzübersicht</h1>
                </div>
                <div class="flex items-center space-x-4">
                    <span class="text-gray-300">Guten Morgen, ${username}</span>
                    @if(email != null) {
                        <span class="text-gray-400 text-sm">${email}</span>
                    }@endif
                    <form action="./csv" method="get">
                        ${csrfHiddenInput}
                        <button type="submit"
                                class="px-4 py-2 text-white rounded-md hover:bg-red-700 hover-text-gradient">
                            CSV importieren
                        </button>
                    </form>
                    <form action="/umsatzeintrag" method="get">
                        ${csrfHiddenInput}
                        <button type="submit"
                                class="px-4 py-2 text-white rounded-md hover:bg-red-700 hover-text-gradient">
                            Buchungen eintragen
                        </button>
                    </form>
                    <form action="/logout" method="post">
                        ${csrfHiddenInput}
                        <button type="submit"
                                class="px-4 py-2 text-white rounded-md hover:bg-red-700 hover-text-gradient">
                            Logout
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </nav>
<main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div class="bg-gray-800 shadow rounded-lg p-6 mt-6 text-center">
            <h2 class="text-2xl font-semibold text-white mb-4">Überblick</h2>
            <div class="bg-gray-800">
                <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
                    <div class="px-4 py-6 sm:px-0">
                        <div class="flex justify-center space-x-4">
                           <button type="button" onclick="showDia()" class="hover-text-gradient">Diagramm</button>
                           <button type="button" onclick="showReport()" class="hover-text-gradient">Report</button>
                            <button type="button" onclick="showSettings()" class="hover-text-gradient">Setting</button>
                        </div>
                    </div>
                </main>
            </div>
        </div>
</main>
</div>
    <script>
        function showDia() {
            window.location.href = "/diagram";
        }
        function showSettings() {
            window.location.href = "/temp_kat";
        }
        function showReport() {
            window.location.href = "/report";
        }
    </script>
`)