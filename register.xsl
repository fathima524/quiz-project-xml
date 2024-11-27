<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
        <head>
            <style>
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #e8f5e9;
                    margin: 0;
                    padding: 20px;
                    color: #2e7d32;
                }
                .container {
                    max-width: 600px;
                    margin: auto;
                    background: #ffffff;
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                    text-align: center;
                    border: 1px solid #81c784;
                }
                h1, h2 {
                    color: #388e3c;
                }
                form {
                    margin-top: 20px;
                    text-align: left;
                }
                field {
                    display: block;
                    margin-bottom: 20px;
                }
                label {
                    font-weight: bold;
                    font-size: 16px;
                    display: block;
                    margin-bottom: 8px;
                    color: #388e3c;
                }
                input {
                    width: 100%;
                    padding: 12px;
                    margin: 8px 0;
                    border: 1px solid #81c784;
                    border-radius: 5px;
                    font-size: 16px;
                    transition: border-color 0.3s ease;
                }
                input:focus {
                    border-color: #388e3c;
                }
                button {
                    background-color: #388e3c;
                    color: white;
                    border: none;
                    padding: 12px 20px;
                    border-radius: 8px;
                    cursor: pointer;
                    font-size: 18px;
                    transition: background-color 0.3s ease, transform 0.3s ease;
                }
                button:hover {
                    background-color: #2e7d32;
                    transform: scale(1.05);
                }
                .difficulty-buttons a {
                    display: inline-block;
                    border: none;
                    padding: 12px 25px;
                    margin: 10px;
                    border-radius: 8px;
                    text-decoration: none;
                    color: white;
                    font-size: 18px;
                    transition: background-color 0.3s ease, transform 0.3s ease;
                    pointer-events: none; /* Initially disabled */
                    opacity: 0.5; /* Looks disabled */
                }
                .difficulty-buttons a.enabled {
                    pointer-events: auto; /* Enable buttons */
                    opacity: 1; /* Looks enabled */
                }
                .difficulty-buttons a:hover {
                    transform: scale(1.05);
                }

                /* Custom colors for the difficulty buttons */
                .difficulty-buttons a[href="welcome-easy.xml"] {
                    background-color: #81c784; /* Green for Easy */
                }
                .difficulty-buttons a[href="welcome-medium.xml"] {
                    background-color: #ffeb3b; /* Yellow for Medium */
                    color: #2e7d32;
                }
                .difficulty-buttons a[href="welcome-hard.xml"] {
                    background-color: #f44336; /* Red for Hard */
                }

                /* Hover Effects for the difficulty buttons */
                .difficulty-buttons a[href="welcome-medium.xml"]:hover {
                    background-color: #fdd835; /* Darker Yellow for hover */
                }
                .difficulty-buttons a[href="welcome-hard.xml"]:hover {
                    background-color: #d32f2f; /* Darker Red for hover */
                }
            </style>
            <script>
                function validateForm() {
                    const inputs = document.querySelectorAll('input');
                    const difficultyLinks = document.querySelectorAll('.difficulty-buttons a');
                    
                    // Check if all fields are filled
                    const allFilled = Array.from(inputs).every(input => input.value.trim() !== '');
                    
                    // Enable or disable difficulty links based on form validity
                    difficultyLinks.forEach(link => {
                        if (allFilled) {
                            link.classList.add('enabled');
                        } else {
                            link.classList.remove('enabled');
                        }
                    });
                }
            </script>
        </head>
        <body>
            <div class="container">
                <!-- Welcome Message -->
                <h1><xsl:value-of select="registration/welcome/h1" /></h1>
                <h2><xsl:value-of select="registration/welcome/h2" /></h2>
                
                <!-- Registration Form -->
                <form oninput="validateForm()">
                    <xsl:for-each select="registration/form/field">
                        <div>
                            <xsl:value-of select="label" />
                            <br />
                            <xsl:copy-of select="input" />
                        </div>
                    </xsl:for-each>
                    <div>
                        <xsl:copy-of select="registration/form/submit/button" />
                    </div>
                </form>

                <!-- Difficulty Selection -->
                <div class="difficulty-buttons" style="margin-top: 20px;">
                    <p><xsl:value-of select="registration/difficulty/p" /></p>
                    <a href="welcome-easy.xml">Easy</a>
                    <a href="welcome-medium.xml">Medium</a>
                    <a href="welcome-hard.xml">Hard</a>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
