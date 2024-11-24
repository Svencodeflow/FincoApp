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
                        <form action="/csv" method="get">
                            ${csrfHiddenInput}
                            <button type="submit"
                                    class="px-4 py-2 bg-orange-600 text-white rounded-md hover:bg-orange-700">
                                CSV importieren
                            </button>
                        </form>
                        <form action="/transactions" method="post">
                            ${csrfHiddenInput}
                            <button type="submit"
                                    class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
                                Buchungen eintragen
                            </button>
                        </form>
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
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">CSV importieren</h2>
                    <div class="space-y-4">
                        <div>
                            <form action="/uploadcsv" method="post" enctype="multipart/form-data">
                                <input type="file" id="myFile" name="file" accept=".csv">
                                <input type="submit" value="Upload">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
`)
