<?php    
    $numbers = [1, 4, 6, 8, 9];
    $fruits = array('orange', 'apple', 'pineapple', 'watermelon');
    var_dump($numbers);
    echo $fruits[0].'<br>';
    //associative array
    $colors = [
        'r' => 'red',
        'g' => 'green',
        'b' => 'blue',
    ];
    //echo $colors[0];//Undefined offset
    var_export($colors);
    echo $colors['g'];
?>