@import de.sic.finco.fincowebapp.CsrfHiddenInput

@param Boolean error = false
@param String errorMessage = null
@param CsrfHiddenInput csrfHiddenInput
@param String cryptoData

@template.layout.main(content = @`
    <style>
        .hover-text-gradient {
            position: relative;
            color: white;
            text-decoration: none;
            background: linear-gradient(to right, rgba(0, 252, 255, 1) 50%, rgba(0, 0, 0, 0.8) 50%);
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
    <div class="flex flex-col min-h-screen" style="background-image: url('/images/wp2446261.jpg'); background-size: cover; background-position: center;">
        <nav>
        <div class="w-full flex items-center justify-between px-4" style="background: rgba( 0, 252, 255, 0.2 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 9px );
            -webkit-backdrop-filter: blur( 9px );
            border-radius: 0px 0px 10px 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 ); height: 60px">
                <img src="/images/logo.png" alt="logo" style="width: 40px" />
                <h1 style="color: black; text-underline: black; font-size: larger; font-style: italic; font-weight: bold; ">Finco: Finanzielle Klarheit auf Knopfdruck.</h1>
                <div class="flex items-end">
                    <button type="button" onclick="showRegister()" class="mr-2 hover-text-gradient">Register</button>
                    <button type="button" onclick="showLogin()" class="hover-text-gradient">
                        Login
                    </button>
                </div>
            </div>
        </nav>
        <main class="flex-grow flex items-center justify-center">
            <div id="login_display" class="flex items-center justify-center mt-14" style="display: none">
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
            <div id="register_card" class="flex items-center justify-center" style="display: none" >
                <div class="flex items-center justify-center">
                    <div class="max-w-md w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
                        <div>
                            <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                                Registrieren sie ihren Account ein
                            </h2>
                        </div>

                        @if(error)
                            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                                <span class="block sm:inline">${errorMessage != null ? errorMessage : "An error occurred during login"}</span>
                            </div>
                        @endif
                        <!-- Login Form -->
                        <form class="mt-8 space-y-6" action="/register" method="POST">
                            ${csrfHiddenInput}
                            <div class="rounded-md shadow-sm -space-y-px">
                                <div>
                                    <input name="username" type="text" required
                                           class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                           placeholder="Benutzername">
                                </div>
                                <div>
                                    <input name="password" type="password" required
                                           class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                           placeholder="Passwort">
                                </div>
                                <div>
                                    <input name="password_confirm" type="password" required
                                           class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                           placeholder="Passwort wiederholen">
                                </div>

                            </div>

                            <div>
                                <button type="submit"
                                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                    Einloggen
                                </button>
                                <div class="relative flex justify-center text-sm">
                                    <span class="px-2 bg-white text-gray-500">Benutzer registrieren</span>
                                </div>
                            </div>
                        </form>

                        <!-- OAuth2 Buttons -->
                        <div class="mt-6">
                            <div class="relative">
                                <div class="absolute inset-0 flex items-center">
                                    <div class="w-full border-t border-gray-300"></div>
                                </div>
                                <div class="relative flex justify-center text-sm">
                                    <span class="px-2 bg-white text-gray-500">oder einloggen / registrieren per</span>
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
            </div>
            <div id="home_card" class="flex justify-center w-2/4 h-96" style="background: rgba( 255, 255, 255, 0.2 );box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );backdrop-filter: blur( 5px );-webkit-backdrop-filter: blur( 5px );border-radius: 10px;border: 1px solid rgba( 255, 255, 255, 0.18 );">
                <div class="flex items-center justify-center h-full w-full text-center">
                        <div class="flex flex-col items-center justify-center h-full w-full text-center">
                            <img src="/images/Group.png" alt="logo" style="width: 140px; margin: 0 auto;" />
                            <p class="font-semibold">Track your spend and income</p>
                        </div>
                    <div><p>Hier Könnte ihre Werbung Stehen!</p></div>
                        <div class="flex flex-col items-center justify-center h-full w-full text-center">
                            <img src="/images/illustration.png" alt="logo" style="width: 140px; margin: 0 auto;" />
                            <p class="font-semibold" style="text-shadow:2px 2px black">Analyze your spending</p>
                        </div>
                </div>
            </div>
        </main>
        <footer class="w-full">
            <div class="w-full h-14 flex items-center px-4" style="background: rgba( 0, 252, 255, 0.2 );
                    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
                    backdrop-filter: blur( 9px );
                    -webkit-backdrop-filter: blur( 9px );
                    border-radius: 0px 0px 10px 10px;
                    border: 1px solid rgba( 255, 255, 255, 0.18 );">
                <div class="flex" >
                    <p style="margin-right: 1em" >Impressum</p>
                    <p>Datenschutz</p>
                </div>
                <div class="absolute bottom-0 right-0 p-4">
                    <p>© 2024 Finco. All rights reserved</p>
                </div>
            </div>
        </footer>
    </div>

    <script>
        function showLogin() {
        var element = {
            login: document.getElementById('login_display'),
            home: document.getElementById('home_card'),
            register: document.getElementById('register_card')
        }
        if (element.login.style.display === 'block') {
            element.login.style.display = 'none';
            element.home.style.display = 'block';
        } else {
            element.login.style.display = 'block';
            element.home.style.display = 'none';
            element.register.style.display = 'none';
        }
    }

    function showRegister() {
        var element = {
            register: document.getElementById('register_card'),
            home: document.getElementById('home_card'),
            login: document.getElementById('login_display')
        }
        if (element.register.style.display === 'block') {
            element.register.style.display = 'none';
            element.home.style.display = 'block';
        } else {
            element.register.style.display = 'block';
            element.home.style.display = 'none';
            element.login.style.display = 'none';
        }
    }
    </script>
`)