@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param Boolean error = false
@param String errorMessage = null
@param CsrfHiddenInput csrfHiddenInput


@template.layout.main(content = @`
    <div class="flex flex-col min-h-screen" style="background-image: url('/images/backFoto.jpeg'); background-size: cover; background-position: center;">
        <nav>
        <div class="w-full flex items-center justify-between px-4" style="background: rgba( 0, 252, 255, 0.2 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 9px );
            -webkit-backdrop-filter: blur( 9px );
            border-radius: 0px 0px 10px 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );">
                <img src="/images/logo.png" alt="logo" style="width: 70px" />
                <h1>Finco Finanzen</h1>
                <div class="flex items-end">
                    <button type="button" class="mr-2">Register</button>
                    <button type="button" onclick="showMain()">Login</button>
                </div>
            </div>
        </nav>
        <main class="flex-grow flex items-center justify-center">
            <div id="main_display" class="flex items-center justify-center mt-14" style="display: none">
                <div class="max-w-md w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
                    <div>
                        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                            Sign in to your account
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
                                <input name="username" type="text" required
                                       class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                       placeholder="Username">
                            </div>
                            <div>
                                <input name="password" type="password" required
                                       class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                       placeholder="Password">
                            </div>
                        </div>

                        <div>
                            <button type="submit"
                                    class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Sign in
                            </button>
                        </div>
                    </form>

                    <!-- OAuth2 Buttons -->
                    <div class="mt-6">
                        <div class="relative">
                            <div class="absolute inset-0 flex items-center">
                                <div class="w-full border-t border-gray-300"></div>
                            </div>
                            <div class="relative flex justify-center text-sm">
                                <span class="px-2 bg-white text-gray-500">Or continue with</span>
                            </div>
                        </div>

                        <div class="mt-6 grid gap-3">
                            <a href="/oauth2/authorization/google"
                               class="w-full inline-flex items-center justify-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-500 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                <img class="h-5 w-5 mr-2" src="https://www.svgrepo.com/show/475656/google-color.svg" alt="Google logo">
                                <span>Google</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div id="home_card" class="flex justify-center" style="display: block">
                <div>
                    <img src="/images/logo.png" alt="card Logo" />
                    <h1>Finco Finanzen</h1>
                    <div>
                        <h1>Mit Finco ganz einfach ihrer Finanzen im blick halten</h1>
                    </div>
                </div>
            </div>
        </main>
        <footer class="w-full">
            <div class="w-full h-80 flex items-center justify-between px-4" style="background: rgba( 0, 252, 255, 0.2 );
                    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
                    backdrop-filter: blur( 9px );
                    -webkit-backdrop-filter: blur( 9px );
                    border-radius: 0px 0px 10px 10px;
                    border: 1px solid rgba( 255, 255, 255, 0.18 );">
                <p>Finco Finanzen</p>
            </div>
        </footer>
    </div>

    <script>
        function showMain() {
            var element = {
                main: document.getElementById('main_display')
            }

            element.main.style.display = 'block';
        }
    </script>
`)