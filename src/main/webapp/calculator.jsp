<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Age Calculator</title>
<style>
*,
*:before,
*:after {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
h1{text-align:center;
margin-top:130px;
}
body {
    background-color: #2c3e50;
    color: #ecf0f1;
    font-family: "Poppins", sans-serif;
}
.container {
    width: 40%;
    min-width: 320px;
    position: absolute;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
}
.inputs-wrapper {
    background-color: #34495e;
    padding: 30px 25px;
    border-radius: 8px;
    margin-bottom: 40px;
    box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.3);
}
input,
button {
    height: 50px;
    background-color: #ecf0f1;
    color: #34495e;
    font-weight: 500;
    border-radius: 5px;
    transition: all 0.3s ease;
}
input {
    width: 100%;
    padding: 0 20px;
    font-size: 14px;
    margin: 20px 0;
}
button {
    width: 100%;
    cursor: pointer;
     background-color:#b3d1ff;
}
button:hover {
    background-color: #2ecc71;
    color: #ecf0f1;
}
.outputs-wrapper {
    width: 100%;
    display: flex;
    justify-content: space-between;
}
.outputs-wrapper div {
    height: 85px;
    width: 85px;
    background-color: #34495e;
    border-radius: 5px;
    color: #ecf0f1;
    display: grid;
    place-items: center;
    padding: 10px 0;
    box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.3);
}
span {
    font-size: 25px;
    font-weight: 500;
}
p {
    font-size: 12px;
    color: #bdc3c7;
    font-weight: 400;
}
a {
    display: block;
    width: 100%;
    background-color: #34495e;
    color: #ecf0f1;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    margin-top: 40px;
    border-radius: 5px;
    box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.3);
    transition: all 0.3s ease;
}
a:hover {
    background-color: #e74c3c;
}
</style>
</head>
<body>
<h1>Age Calculator</h1>
<div class="container">
    <div class="inputs-wrapper">
        <input type="date" id="date-input">
        <button onclick="ageCalculate()">Calculate</button>
    </div>
    <div class="outputs-wrapper">
        <div>
            <span id="years"> - </span>
            <p>Years</p>
        </div>
        <div>
            <span id="months"> - </span>
            <p>Months</p>
        </div>
        <div>
            <span id="days"> - </span>
            <p>Days</p>
        </div>
    </div>
</div>
<script>
const months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function leapchecker(year) {
    if (year % 4 == 0 || (year % 100 == 0 && year % 400 == 0)) {
        months[1] = 29;
    } else {
        months[1] = 28;
    }
}

function ageCalculate() {
    let today = new Date();
    let inputDate = new Date(document.getElementById("date-input").value);

    let birthMonth, birthDate, birthYear;
    let birthDetails = {
        date: inputDate.getDate(),
        month: inputDate.getMonth() + 1,
        year: inputDate.getFullYear()
    };
    let currentYear = today.getFullYear();
    let currentMonth = today.getMonth() + 1;
    let currentDate = today.getDate();

    leapchecker(currentYear);

    if (
        birthDetails.year > currentYear ||
        (birthDetails.month > currentMonth && birthDetails.year == currentYear) ||
        (birthDetails.date > currentDate &&
            birthDetails.month == currentMonth &&
            birthDetails.year == currentYear)
    ) {
        alert("Not yet born");
        displayResult("-", "-", "-");
        return;
    }

    birthYear = currentYear - birthDetails.year;

    if (currentMonth >= birthDetails.month) {
        birthMonth = currentMonth - birthDetails.month;
    } else {
        birthYear--;
        birthMonth = 12 + currentMonth - birthDetails.month;
    }

    if (currentDate >= birthDetails.date) {
        birthDate = currentDate - birthDetails.date;
    } else {
        birthMonth--;
        let days = months[currentMonth - 2];
        birthDate = days + currentDate - birthDetails.date;
        if (birthMonth < 0) {
            birthMonth = 11;
            birthYear--;
        }
    }
    displayResult(birthDate, birthMonth, birthYear);
}

function displayResult(bDate, bMonth, bYear) {
    document.getElementById("years").textContent = bYear;
    document.getElementById("months").textContent = bMonth;
    document.getElementById("days").textContent = bDate;
}
</script>
</body>
</html>
