@template.layout.main(content = @`
    <form action="/" method="get">
        <select name="lang" onchange="this.form.submit()">
            <option value="en" selected>English</option>
            <option value="de">Deutsch</option>
        </select>
    </form>

    <div class="flex items-center justify-center h-screen">
        <img id="logo1" src="/images/logo.png" alt="Logo" onclick="swapLogos()">
        <div id="illu" class="flex flex-col items-center justify-center h-screen">
            <img id="logo2" src="/images/Group.png" alt="Logo 2" style="display: none; z-index: auto">
            <h1 id="text" class="text-5xl" style="display: none; margin-bottom: 1em; margin-top: 1em;">Track your spend and income</h1>
            <p id="text_2" style="display: none; text-align: center; width: 30vw">${messages["income"]}</p>

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
        function swapSite() {
            var elements = {
                logo: document.getElementById('illu'),
                illu: document.getElementById('logo3'),
                text1: document.getElementById('text_1'),
                text2: document.getElementById('text2'),
                button: document.getElementById('getStart')
            };

            var isLogoVisible = elements.logo.style.display !== 'none';
            elements.logo.style.display = isLogoVisible ? 'none' : 'block';
            elements.illu.style.display = isLogoVisible ? 'block' : 'none';
            elements.text1.style.display = isLogoVisible ? 'block' : 'none';
            elements.text2.style.display = isLogoVisible ? 'block' : 'none';
            elements.button.style.display = isLogoVisible ? 'block' : 'none';
        }

        function swapLogos() {
            var elements = {
                logo1: document.getElementById('logo1'),
                logo2: document.getElementById('logo2'),
                text: document.getElementById('text'),
                text2: document.getElementById('text_2'),
                skip: document.getElementById('skip'),
                next: document.getElementById('next')
            };

            var isLogoVisible = elements.logo1.style.display !== 'none';
            elements.logo1.style.display = isLogoVisible ? 'none' : 'block';
            elements.logo2.style.display = isLogoVisible ? 'block' : 'none';
            elements.text.style.display = isLogoVisible ? 'block' : 'none';
            elements.text2.style.display = isLogoVisible ? 'block' : 'none';
            elements.skip.style.display = isLogoVisible ? 'block' : 'none';
            elements.next.style.display = isLogoVisible ? 'block' : 'none';
        }

        function skipSite() {
            window.location.href = "/login"
        }

        function start() {
            window.location.href = "/login"
        }
    </script>
`)