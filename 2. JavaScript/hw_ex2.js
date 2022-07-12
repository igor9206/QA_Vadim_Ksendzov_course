// 2*:
// Преобразовать задание 1* таким образом, чтобы первым делом в функции проверялся тип данных. И если он не Number - кидалась ошибка.

const checkAge = function(age) {
    if (typeof age != "number"){
        console.log("Error! type age not number!")
    } else {
    
    if (age < 18){
        console.log("You don't have access cause your age is " + age + " It's less then")
    } else if (age >= 18 && age < 60) {
        console.log("Welcome!!")
    } else if (age > 60) {
        console.log("Keep calm and look Culture channel")
    } else {console.log("Technical work")}

    }
}

checkAge(17);
checkAge(18);
checkAge(61);
checkAge('hi');