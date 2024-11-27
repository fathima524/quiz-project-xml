<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/results">
        <html>
            <head>
                <title>Quiz Results</title>
                <style>
                    body {
                        font-family: 'Poppins', sans-serif;
                        background: linear-gradient(135deg, #81c784, #388e3c);
                        color: #333;
                        margin: 0;
                        padding: 0;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-height: 100vh;
                    }
                    .container {
                        width: 90%;
                        max-width: 800px;
                        background-color: #fff;
                        border-radius: 10px;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                        padding: 20px;
                    }
                    h1 {
                        text-align: center;
                        color: #2e7d32;
                    }
                    .score {
                        font-size: 1.5em;
                        text-align: center;
                        color: #388e3c;
                        margin-top: 20px;
                    }
                    .feedback {
                        font-size: 1.2em;
                        text-align: center;
                        font-weight: bold;
                        margin-top: 20px;
                    }
                    .correct-answers {
                        margin-top: 30px;
                        font-size: 1.1em;
                    }
                    .correct-answers p {
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Quiz Results</h1>
                    <!-- Display Score -->
                    <div class="score">
                        <xsl:value-of select="score"/>
                    </div>

                    <!-- Display Feedback based on Score -->
                    <div class="feedback">
                        <xsl:choose>
                            <!-- Check if score is 8 or more -->
                            <xsl:when test="score &gt;= 8">Good Job!</xsl:when>

                            <!-- Check if score is more than 5 -->
                            <xsl:when test="score &gt; 5">Good Work!</xsl:when>

                            <!-- Check if score is less than or equal to 5 -->
                            <xsl:otherwise>Can Do Better!</xsl:otherwise>
                        </xsl:choose>
                    </div>

                    <!-- Display Correct Answers for Review -->
                    <div class="correct-answers">
                        <p><b>Correct Answers:</b></p>
                        <xsl:for-each select="correct_answers/question">
                            <div>
                                <p><b>Question:</b> <xsl:value-of select="text"/></p>
                                <p><b>Correct Answer:</b> <xsl:value-of select="correct_answer"/></p>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
