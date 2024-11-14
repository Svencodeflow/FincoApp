@template.layout.main(content = @`
    <div class="flex items-center justify-center h-screen">
        <img id="logo1" src="/images/logo.png" alt="Logo" onclick="swapLogos()">
        <div id="illu" class="flex flex-col items-center justify-center h-screen">
            <img id="logo2" src="/images/Group.png" alt="Logo 2" style="display: none; z-index: auto">
            <h1 id="text" class="text-5xl" style="display: none; margin-bottom: 1em; margin-top: 1em;">Track your spend and income</h1>
            <p id="text_2" style="display: none; text-align: center; width: 30vw">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam</p>

            <div class="flex" style="margin-top: 5em">
                <button id="skip" onclick="skipSite()" style="display: none;margin-right: 5em">Skip</button>
                <button id="next" onclick="swapSite()" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full" style="display: none;"> Next <span class="ml-2">&#8594;</span> </button>
            </div>
        </div>
        <div id="group" class="flex flex-col items-center justify-center h-screen">
            <img id="logo3" src="/images/Illustration.png" alt="Logo 3" style="display: none; z-index: auto">
            <h1 id="text_1" class="text-5xl" style="display: none; margin-bottom: 1em; margin-top: 1em">Analyze your spending</h1>
            <p id="text2" style="display: none; text-align: center; width: 30vw">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam</p>

            <div>
                <button id="getStart" onclick="start()" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full" style="display: none; margin-top: 5em">Get Started <span class="ml-2">&#8594;</span></button>
            </div>
        </div>
    </div>


    <script>
        function swapLogos() {
            let logo1 = document.getElementById('logo1');
            let logo2 = document.getElementById('logo2');
            let text = document.getElementById('text');
            let text2 = document.getElementById('text_2');
            let but1 = document.getElementById('skip');
            let but2 = document.getElementById('next');

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

        function swapSite() {
            let fLookAfterLogo = document.getElementById('illu');
            let fLookAfterIllu = document.getElementById("logo3");
            let fLookAfterText = document.getElementById("text_1");
            let fLookAfterText2 = document.getElementById("text2");
            let button = document.getElementById("getStart");

            if (fLookAfterLogo.style.display !== 'none') {
                fLookAfterLogo.style.display = 'none';
                fLookAfterIllu.style.display = 'block';
                fLookAfterText.style.display = 'block';
                fLookAfterText2.style.display = 'block';
                button.style.display = 'block';
            } else {
                fLookAfterLogo.style.display = 'block';
                fLookAfterIllu.style.display = 'none';
                fLookAfterText.style.display = 'none';
                fLookAfterText2.style.display = 'none';
                button.style.display = 'none';
            }
        }

        function skipSite() {
            window.location.href = "/login"
        }

        function start() {
            window.location.href = "/login"
        }
    </script>
`)
