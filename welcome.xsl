<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/welcome">
        <html>
            <head>
                <title>Welcome Page</title>
                <style>
                    body {
                        font-family: 'Poppins', sans-serif;
                        background: linear-gradient(135deg, #81c784, #388e3c);
                        color: #fff;
                        margin: 0;
                        padding: 0;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        height: 100vh;
                    }
                    .container {
                        text-align: center;
                        background-color: rgba(255, 255, 255, 0.9);
                        padding: 30px;
                        border-radius: 15px;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                    }
                    h1 {
                        font-size: 2.5em;
                        margin-bottom: 20px;
                        color: #2e7d32;
                    }
                    p {
                        font-size: 1.2em;
                        margin-bottom: 20px;
                        color: #333;
                    }
                    #countdown {
                        font-size: 1.5em;
                        margin-bottom: 20px;
                        color: #ff5722;
                    }
                    button {
                        background-color: #388e3c;
                        color: #fff;
                        border: none;
                        padding: 10px 20px;
                        font-size: 1em;
                        border-radius: 5px;
                        cursor: pointer;
                        transition: background-color 0.3s, transform 0.2s;
                        pointer-events: none;
                        opacity: 0.5;
                    }
                    button.active {
                        pointer-events: all;
                        opacity: 1;
                    }
                    button:hover {
                        background-color: #2e7d32;
                        transform: scale(1.05);
                    }
                </style>
                <script>
                    <![CDATA[
                    let countdownTime = 5; // Countdown time in seconds
                    function startCountdown() {
                        const countdownElement = document.getElementById('countdown');
                        const startButton = document.getElementById('startButton');

                        const timer = setInterval(() => {
                            countdownElement.textContent = `Quiz starts in: ${countdownTime} seconds`;
                            if (countdownTime <= 0) {
                                clearInterval(timer);
                                countdownElement.textContent = "Ready to begin!";
                                startButton.classList.add('active');
                            }
                            countdownTime--;
                        }, 1000);
                    }

                    window.onload = startCountdown;
                    ]]>
                </script>
            </head>
            <body>
                <div class="container">
                    <!-- Dynamically display welcome message based on the XML -->
                    <h1><xsl:value-of select="h1" /></h1>
                    <p><xsl:value-of select="h2" /></p>

                    <div id="countdown">Quiz starts in: 5 seconds</div>
                    <button id="startButton" onclick="window.location.href='quiz.xml'">Start</button>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
