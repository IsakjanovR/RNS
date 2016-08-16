<?php
    $cityQuery = "SELECT * FROM `city`";
    if ($result = mysqli_query($db, $cityQuery)) {
        $arrCity = array();
        while($rowCity = mysqli_fetch_array($result))
        {
            $arrCity[] = $rowCity;
        }
        mysqli_free_result($result);
    }

$QualificationQuery = "SELECT * FROM `qualification`";
if ($result = mysqli_query($db, $QualificationQuery)) {
    $arrQualification = array();
    while($rowQualification = mysqli_fetch_array($result))
    {
        $arrQualification[] = $rowQualification;
    }
    mysqli_free_result($result);
}