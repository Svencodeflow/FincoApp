@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param Boolean error = false
@param String errorMessage = null
@param CsrfHiddenInput csrfHiddenInput


@template.layout.main(
content = @`
    <div class="min-h-screen flex items-center justify-center">
        <div class="max-w-md w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
            <div>
                <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                    Loggen sie sich in ihren Account ein
                </h2>
            </div>

            @if(error)
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                    <span class="block sm:inline">${errorMessage != null ? errorMessage : "An error occurred during login"}</span>
                </div>
            @endif

            <!-- Login Form -->
            <form class="mt-8 space-y-6" action="/login" method="POST">
                ${csrfHiddenInput}
                <div class="rounded-md shadow-sm -space-y-px">
                    <div>
                        <label>
                            <input name="username" type="text" required
                                   class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                   placeholder="Benutzername">
                        </label>
                    </div>
                    <div>
                        <label>
                            <input name="password" type="password" required
                                   class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                   placeholder="Passwort">
                        </label>
                    </div>
                </div>
                <div>
                    <button type="submit"
                            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Einloggen
                    </button>
                    <div class="relative flex justify-center text-lg">
                        <!--<a onclick="startReg()" ><span class="px-2 bg-white text-gray-500">Benutzer registrieren</span></a>-->
                        <button onclick="startReg()" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Register</button>
                    </div>
                </div>
            </form>

            <!-- OAuth2 Buttons -->
            <div class="mt-6">
                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300"></div>
                    </div>
                    <a class="relative flex justify-center text-sm">
                         <span class="px-2 bg-white text-gray-500">oder einloggen / registrieren per</span>
                    </a>
                </div>

                <div class="mt-6 grid gap-3">
                    <a href="/oauth2/authorization/google"
                       class="w-full inline-flex items-center justify-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-500 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        <img class="h-5 w-5 mr-2" src="https://www.svgrepo.com/show/475656/google-color.svg" alt="Google logo"/>
                        <span>Google</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        function startReg() {
            window.location.href = "/register"
        }
    </script>
`)