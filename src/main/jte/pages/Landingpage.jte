<head>
    <Link rel="stylesheet" href="landingpage.css" type="text/css"/>
</head>

@template.layout.main(content = @`
    <div class="flex items-center justify-center h-screen">
        <img id="logo1" src="/logo.png" alt="Logo" onclick="swapLogos()">
        <div class="flex flex-col items-center justify-center h-screen">
            <img id="logo2" src="/Group.png" alt="Logo 2" style="display: none; z-index: auto">
            <h1 id="text" class="text-5xl" style="display: none; margin-bottom: 1em; margin-top: 1em">Hier könnte ihre werbung stehen</h1>
            <p id="text_2" style="display: none; text-align: center">LoremLoremLorem</p>
            <div class="flex">
                <button id="skip" style="display: none;">Skip</button>
                <button id="next" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full" style="display: none;"> Next <span class="ml-2">&#8594;</span> </button>
            </div>
        </div>
        <div class="flex flex-col items-center justify-center">
            <img id="logo3" src="/Illustration.png" alt="Logo 3" style="display: none">
        </div>
    </div>


    <script>
        function swapLogos() {
            var logo1 = document.getElementById('logo1');
            var logo2 = document.getElementById('logo2');
            var text = document.getElementById('text');
            var text2 = document.getElementById('text_2');
            var but1 = document.getElementById('skip');
            var but2 = document.getElementById('next');

            if (logo1.style.display !== 'none') {
                logo1.style.display = 'none';
                logo2.style.display = 'block';
                text.style.display = 'block';
                text2.style.display = 'block';
                but1.style.display = 'block';
                but2.style.display = 'block';
            } else {
                logo1.style.display = 'block';
                logo2.style.display = 'none';
                text.style.display = 'none';
                text2.style.display = 'none';
                but1.style.display = 'none';
                but2.style.display = 'none';
            }
        }
    </script>
`)
