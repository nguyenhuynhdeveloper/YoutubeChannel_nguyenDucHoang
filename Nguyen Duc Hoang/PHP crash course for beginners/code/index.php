<?php
/**
 * Install Live Server Web Extension Chrome
 * Install Live Server, PHP Server on VSCode
 * Right click php file, "Reload server"
 */
    //echo "Hello sdddddss";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1><?php echo 123;?></h1>
    <h1><?php 
        echo 'Hoang, age = ',18,'year of birth: ', 1979;
        //print 'hello', 123; //cannot do this       
        //print 'Hello world'; //only 1 parameter
        print_r(['sushi', 'Sashimi', 'Ramen', 'Udon']); 
        //echo ['sushi', 'Sashimi', 'Ramen', 'Udon']; //cannot do that
        var_dump('hello');//values like objects
        var_export(['iphone', 'laptop', 'ipad', 'pc'])
        //remove echo, use =
    ?></h1> 
    <h1><?= 'This is a string' ?></h1>
</body>
</html>