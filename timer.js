let score = 0;
let timer = 120; // 2 minutes timer (in seconds)
let timerInterval;

function startTimer() {
    timerInterval = setInterval(function() {
        // Update the timer display every second
        document.getElementById("timer").textContent = "Time Left: " + timer + "s";
        
        // When timer hits 0
        if (timer <= 0) {
            clearInterval(timerInterval); // Stop the timer
            document.getElementById("timer").textContent = "Time's up!";
            alert("Time's up!"); // Display the alert
            // Disable further answer selection if time is up
            const options = document.querySelectorAll(".options li");
            options.forEach(option => option.setAttribute("onclick", ""));
        }
        timer--; // Decrement the timer every second
    }, 1000);
}

function checkAnswer(event, correctAnswer) {
    const selectedAnswer = event.target.innerText;
    const resultElement = event.target.parentElement.nextElementSibling;

    if (selectedAnswer === correctAnswer) {
        score++;
        resultElement.textContent = "Correct Answer!";
        resultElement.className = "result correct";
    } else {
        resultElement.textContent = `Wrong Answer! The correct answer is: ${correctAnswer}`;
        resultElement.className = "result wrong";
    }
    document.getElementById("score").textContent = "Your Score: " + score;
}

// Start the timer when the page loads
window.onload = function() {
    startTimer();
};
