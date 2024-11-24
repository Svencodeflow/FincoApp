@import org.springframework.security.core.GrantedAuthority
@import java.util.Collection
@import de.sic.finco.fincowebapp.CsrfHiddenInput
@import de.sic.finco.fincowebapp.Settings
@import de.sic.finco.fincowebapp.MainController

@param String language


@template.layout.main(content = @`
    <style>
        /* Zusätzliche benutzerdefinierte CSS-Stile */
        input[type="text"], input[type="file"], select {
            color: grey; /* Textfarbe auf Schwarz setzen */
            border-color: black; /* Randfarbe auf Grau setzen */
        }
      <style>
        /* Zusätzliche benutzerdefinierte CSS-Stile */
        img.profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
<div class="container mx-auto p-4">
    <h1 class="text-3xl font-bold mb-6">Einstellungen</h1>
    <div class="mb-8">
        <label for="language" class="block text-sm font-medium text-gray-700">Sprache:</label>
        <select id="language" name="language" class="mt-1 p-2 block w-full border rounded-md" onchange="changeLanguage(this)">
            <option value="de">Deutsch</option>
            <option value="en">Englisch</option>
        </select>
    </div>
    <div class="mb-8">
        <label for="profilePic" class="block text-sm font-medium text-gray-700">Profilbild:</label>
        <input type="file" id="profilePic" name="profilePic" class="mt-1 p-2 block w-full border rounded-md" accept="image/*" onchange="previewProfilePic()">
        <div class="mt-4">
            <img id="profilePicPreview" class="profile-pic" src="" alt="Profilbild-Vorschau" style="display: none;">
        </div>
    </div>
</div>
    <div class="mb-8">
        <label for="username" class="block text-sm font-medium text-gray-700">Benutzername:</label>
        <input type="text" id="username" name="username" required class="mt-1 p-2 block w-full border rounded-md"/>
    </div>
    <div class="mb-8">
        <label for="email" class="block text-sm font-medium text-gray-700">E-Mail:</label>
        <input type="email" id="email" name="email" required class="mt-1 p-2 block w-full border rounded-md"/>
    </div>
    <div>
        <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded" onclick="submitSettings()">Speichern</button>
    </div>
    <div>
        <button onclick="history.back()" class="bg-blue-500 text-white py-2 px-4 rounded">>Zurück</button>
    </div>
</div>

<script>
    function changeLanguage(select) {
        const language = select.value;
        window.location.href = ?lang=${language};
    }

    function previewProfilePic() {
    const file = document.getElementById('profilePic').files[0];
    const reader = new FileReader();

    reader.onloadend = function () {
    const preview = document.getElementById('profilePicPreview');
    preview.src = reader.result;
    preview.style.display = 'block';
    };

    if (file) {
    reader.readAsDataURL(file);
    } else {
    const preview = document.getElementById('profilePicPreview');
    preview.src = '';
    preview.style.display = 'none';
    }
    }

    function submitSettings() {
    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const profilePic = document.getElementById('profilePic').files[0];

    const formData = new FormData();
            formData.append('username', username);
            formData.append('email', email);
    if (profilePic) {
        formData.append('profilePic', profilePic);
    }

    fetch('/update-settings', {
        method: 'POST',
    body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Einstellungen erfolgreich gespeichert!');
        } else {
            console.error('Fehler beim Speichern der Einstellungen:', data.error);
        }
    })
    .catch(error => {
        console.error('Fehler beim Senden der Anfrage:', error);
    });

    function loadProfilePic() {
        fetch('/get-profile-pic')
            .then(response => response.blob())
            .then(blob => {
                const url = URL.createObjectURL(blob);
                const profilePicPreview = document.getElementById('profilePicPreview');
                profilePicPreview.src = url;
                profilePicPreview.style.display = 'block';
            })
            .catch(error => {
                 console.error('Fehler beim Laden des Profilbildes:', error);
            });
    }
    document.addEventListener('DOMContentLoaded', function() {
        loadProfilePic(); // Lade das Profilbild beim Laden der Seite
    });
}
</script>
`)
