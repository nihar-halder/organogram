<?php
require '../vendor/autoload.php';

use Organogram\employee;

// Example to show some employee
$emp = new Employee();
$data = $emp->getEmployee();
echo "<hr/>";
echo "<br/><br/> All Employees: <br/><br/>";
echo "<pre>";
print_r($data);
echo "</pre>";


echo "<hr/>";
$data = $emp->getEmployeeUnderMe(1, 1);
echo "<pre>";
print_r($data);
echo "</pre>";


// Example to show organogram: drowOrganogram(EMP_ID, DPT_ID)
// Department 1 organogram
echo "<hr/>";
echo "<samp>";
$emp->drowOrganogram(1, 1);
echo "</samp>";

// Department 2 organogram
echo "<hr/>";
echo "<samp>";
$emp->drowOrganogram(3, 2);
echo "</samp>";
