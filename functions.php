<?php
$is_auth = rand(0, 1);

$categories = [
    "boards" => "Доски и лыжи",
    "attachment" => "Крепления",
    "boots" => "Ботинки",
    "clothing" => "Одежда",
    "tools" => "Инструменты",
    "other" => "Разное"
];

$lots = [
    ["name" => "2014 Rossignol District Snowboard", "category" => "Доски и лыжи", "price" => 10999, "image" => "img/lot-1.jpg"],
    ["name" => "DC Ply Mens 2016/2017 Snowboard", "category" => "Доски и лыжи", "price" => 159999, "image" => "img/lot-2.jpg"],
    ["name" => "Крепления Union Contact Pro 2015 года размер L/XL", "category" => "Крепления", "price" => 8000, "image" => "img/lot-3.jpg"],
    ["name" => "Ботинки для сноуборда DC Mutiny Charocal", "category" => "Ботинки", "price" => 10999, "image" => "img/lot-4.jpg"],
    ["name" => "Куртка для сноуборда DC Mutiny Charocal", "category" => "Одежда","price" => 7500,"image" => "img/lot-5.jpg"],
    ["name" => "Маска Oakley Canopy", "category" => "Разное", "price" => 5400, "image" => "img/lot-6.jpg"]
];

function F_price($val, $r_flag){
    $sprice = number_format($val, 0, ".", " ");
?>
<span class="lot__cost">
    <?=$sprice?>
<?php
    if ($r_flag == true) {
?>
<b class="rub">р</b>
<?php
    }
?>
</span>
<?php
}

$user_name = 'Иван'; // укажите здесь ваше имя

function Remain(){
$now_time = strtotime("now");
$tomorrow_time = strtotime("tomorrow");
$time_remains = $tomorrow_time - $now_time;
$hours_remains = floor($time_remains/3600);
$time_remains = $time_remains - $hours_remains * 3600;
$minutes_remains = floor($time_remains/60);
$time_format = "%d:%u";
$remains = sprintf($time_format, $hours_remains, $minutes_remains);
return $remains;
}

?>
<?php

function include_template($name, $data) 
    {
        $name = 'templates/' . $name;
        $result = '';
        if (!file_exists($name)) 
            {
                return $result;
            }
        ob_start();
        extract($data);
        require $name;
        $result = ob_get_clean();
        return $result;
    }
?>