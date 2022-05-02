<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $name = 'Hoang';//string
        //echo $name;
        $age = 18;//number
        //echo $age;
        $is_adult = true;
        //var_dump($is_adult);
        $deposit = 123.55;
        //var_dump($deposit);
        //echo 'My name is '.$name.', and '.$age.' years old';
        //echo "My name is $name , and $age years old";
        //echo "My name is ${name} , and ${age} years old";
        $x = '1' + '2';//differ from js
        //echo $x;
        //echo 10 / 2;
        echo 10 % 3;
        define('SERVER', 'localhost');
        define('DB_NAME', 'test_db');
        echo DB_NAME;
    ?>
</body>
</html>