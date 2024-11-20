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
                        <h1 class="text-xl font-semibold">Transaktionen buchen</h1>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-gray-700">Welcome, ${username}</span>
                        @if(email != null)
                            <span class="text-gray-500 text-sm">${email}</span>
                        @endif
    <div class="test">
        <h1 class="text-4xl font-bold text-center">Welcome</h1>
        <div class="flex justify-center">
            <a href="/login"
               class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
                Login
            </a>
        </div>
    </div>
`)