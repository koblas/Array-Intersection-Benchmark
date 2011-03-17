#!/usr/bin/php  -d memory_limit=1G
<?php

$x = array();
$y = array();

foreach (file($argv[1]) as $line) {
    list($a, $b) = preg_split("/\s+/", $line);
    if ($b !== null) {
        array_push($x, $a);
        array_push($y, $b);
    }
}

$t0 = microtime(true);
$xy = isect($x, $y);
$t1 = microtime(true);

printf("Set   | n = %d : %d intersects found in %f seconds\n", count($x), count($xy), $t1 - $t0);

function isect($a, $b) {
    $h = array();
    $o = array();

    foreach ($a as $i) {
        $h[$i] = true;
    }
    foreach ($b as $i) {
        if ($h[$i]) {
            array_push($o, $i);
        }
    }

    return $o;
}
