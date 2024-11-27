<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Quiz Application</title>
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
                        text-align: center;
                    }
                    h1 {
                        text-align: center;
                        color: #2e7d32;
                    }
                    .question {
                        display: none;
                        margin: 20px 0;
                        padding: 15px;
                    }
                    .options {
                        list-style-type: none;
                        padding: 0;
                    }
                    .options li {
                        margin: 10px 0;
                        cursor: pointer;
                        padding: 10px;
                        border: 1px solid #ccc;
                        border-radius: 5px;
                        transition: background-color 0.3s, transform 0.2s;
                    }
                    .options li:hover {
                        background-color: #81c784;
                        transform: scale(1.02);
                    }
                    .result {
                        margin-top: 10px;
                        font-weight: bold;
                        color: #2e7d32;
                    }
                    .result.wrong {
                        color: #d32f2f;
                    }
                    .result.correct-answer {
                        color: #388e3c;
                    }
                    .score {
                        font-size: 1.5em;
                        color: #388e3c;
                        margin-top: 20px;
                    }
                    .timer {
                        font-size: 1.2em;
                        color: #ff7043;
                        margin-top: 20px;
                    }
                    .submit-button {
                        display: block;
                        padding: 10px 20px;
                        margin: 20px auto;
                        background-color: #388e3c;
                        color: white;
                        font-size: 1.2em;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                    }
                    .submit-button:hover {
                        background-color: #2e7d32;
                    }
                    .nav-buttons {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 20px;
                    }
                    .nav-buttons button {
                        padding: 10px 20px;
                        font-size: 1em;
                        background-color: #388e3c;
                        color: white;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                    }
                    .nav-buttons button:hover {
                        background-color: #2e7d32;
                    }
                    .nav-buttons button:disabled {
                        background-color: #bdbdbd;
                        cursor: not-allowed;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Quiz Application</h1>
                    <div id="score"></div>
                    <xsl:for-each select="quiz/question">
                        <div class="question" id="question-{position()}">
                            <p><b>Question:</b> <xsl:value-of select="text"/></p>
                            <ul class="options">
                                <li onclick="checkAnswer(event, '{answer}', this)">
                                    <xsl:value-of select="option1"/>
                                </li>
                                <li onclick="checkAnswer(event, '{answer}', this)">
                                    <xsl:value-of select="option2"/>
                                </li>
                                <li onclick="checkAnswer(event, '{answer}', this)">
                                    <xsl:value-of select="option3"/>
                                </li>
                                <li onclick="checkAnswer(event, '{answer}', this)">
                                    <xsl:value-of select="option4"/>
                                </li>
                            </ul>
                            <p class="result"></p>
                        </div>
                    </xsl:for-each>
                    <div class="nav-buttons">
                        <button id="prev-btn" onclick="prevQuestion()">Previous</button>
                        <button id="next-btn" onclick="nextQuestion()">Next</button>
                    </div>
                    
                </div>

                <script><![CDATA[
                    var currentQuestion = 0;
                    var score = 0;
                    var totalQuestions = document.getElementsByClassName('question').length;

                    function showQuestion() {
                        var questions = document.getElementsByClassName('question');

                        // Hide all questions
                        for (var i = 0; i < questions.length; i++) {
                            questions[i].style.display = 'none';
                        }

                        // Show the current question or display the final score
                        if (currentQuestion < totalQuestions) {
                            questions[currentQuestion].style.display = 'block';
                            document.getElementById('prev-btn').disabled = currentQuestion === 0;
                            document.getElementById('next-btn').disabled = currentQuestion === totalQuestions - 1;
                        } else {
                            document.getElementById('score').innerText = "Your Score: " + score + " / " + totalQuestions;
                        }
                    }

                    function checkAnswer(event, correctAnswer, selectedElement) {
                        var selectedAnswer = event.target.innerText.trim();
                        var result = selectedElement.nextElementSibling; // To show the result under the selected option
                        
                        // Display correct answer if wrong
                        if (selectedAnswer === correctAnswer.trim()) {
                            score++;
                            result.className = 'result';
                            result.innerText = 'Correct!';
                        } else {
                            result.className = 'result wrong';
                            result.innerText = 'Wrong! The correct answer is: ' + correctAnswer.trim();
                        }

                        // Disable options after answer is selected
                        var options = selectedElement.parentNode.getElementsByTagName('li');
                        for (var i = 0; i < options.length; i++) {
                            options[i].onclick = null; // Disable all clicks
                        }

                        currentQuestion++;
                        showQuestion();
                    }

                    // Previous and Next Question Navigation
                    function prevQuestion() {
                        if (currentQuestion > 0) {
                            currentQuestion--;
                            showQuestion();
                        }
                    }

                    function nextQuestion() {
                        if (currentQuestion < totalQuestions - 1) {
                            currentQuestion++;
                            showQuestion();
                        }
                    }

                    window.onload = function () {
                        showQuestion();
                    };
                ]]></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
