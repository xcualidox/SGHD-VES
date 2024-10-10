<?php
function pagination($object, $page_number, $filter)
{
    $max_per_page = 10;
    $object->setPaginationFilter($filter);
    $total_rows = $object->countAll()["n_records"];
    $lastPage = ceil( $total_rows/$max_per_page);
    $lastPage = $lastPage < 1 ? 1 : $lastPage;
    $page_number = $page_number < 1? 1 :  ($page_number > $lastPage? $lastPage :  $page_number);
    $offset = ($page_number - 1) * $max_per_page.",".$max_per_page;
    $object->setPagination($offset);
    $result = $object->getAll();
    $response = [
        'data' => $result ? $result : [false],
        'total' => $total_rows
    ];
    return json_encode($response);
}

?>