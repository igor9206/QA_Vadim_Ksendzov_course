// 4***:
// Преобразовать задание 3* таким образом, чтобы возраст вводится используя функцию prompt в привязанной верстке

const checkAge = function(age){    
    if (age.trim() == "" || Number.isNaN(Number(age))) {
        alert("Error!! Not number")        
    } else {

        if (age < 18){
            window.alert("You don't have access cause your age is " + age + " It's less then")
        } else if (age >= 18 && age < 60){
            alert("Welcome !")
        }else if (age > 60){
            alert("Keep calm and look Culture channel")
        } else {
            alert("Technical work")
        }
    }
}
checkAge(prompt("How old are you?"));