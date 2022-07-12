// JS. HW_2

// Напишите валидационный скрипт используя функции 

//  1. Скрипт должен на вход принимать строку.
//  2. После проверки строки выводить в консоль сообщение где будет конкретно написано, что не так в ведённой строке.
//  3. Минимум 5 символов в строке
//  4. Максимум 64 символа в строке
//  5. В строке должны быть буквы
//  6. Должна быть хотя бы одна буква в верхнем регистре
//  7. Должна быть хотя бы одна цифра
//  8. Должна быть хотя бы одна @
//  9. Строка не должна быть пустой

let my_string = 'sDgdfg3@'
//Результирующая функция
function valid(input_str){
    if (valid_pustota(input_str) && min_5(input_str) && max_64(input_str) && valid_letters(input_str) &&
    valid_big_letters(input_str) && valid_numbers(input_str) && valid_symbol(input_str)){
        console.log('Строка соответсвует требованиям!')
    }
}
//Вызов результирующей функции
valid(my_string)

//  3. Минимум 5 символов в строке
function min_5(input_str){
    if (input_str.length < 5){
        console.log('Ошибка! Строка меньше 5 символов')
    } else {
        return true
    }
}
//  4. Максимум 64 символа в строке
function max_64(input_str){
    if (input_str.length > 64){
        console.log('Ошибка! Строка длиннее 64 символов')
    } else {
        return true
    }
}
//  5. В строке должны быть буквы
function valid_letters(input_str){
    if (!/[a-zA-Zа-яА-Я]/.test(input_str)){
            console.log("Ошибка! Отсутствуют буквы.")
    } else {
        return true
    }
}
//  6. Должна быть хотя бы одна буква в верхнем регистре
function valid_big_letters(input_str){
    if (!/[A-ZА-Я]/.test(input_str)){
            console.log("Ошибка! Отсутствуют буквы в верхнем регистре.")
    } else {
        return true
    }
}
//  7. Должна быть хотя бы одна цифра
function valid_numbers(input_str){
    if (!/\d/.test(input_str)){
            console.log("Ошибка! Отсутствуют цифры.")
    } else {
        return true
    }
}
//  8. Должна быть хотя бы одна @
function valid_symbol(input_str){
    if (!/@/.test(input_str)){
            console.log("Ошибка! Отсутствует спец символ @.")
    } else {
        return true
    }
}
//  9. Строка не должна быть пустой
function valid_pustota(input_str){
        if (!String){
            console.log("Ошибка! Пустая строка.")
        } else {
            return true
        }
    }