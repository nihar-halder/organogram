<?php

namespace Organogram;


use Organogram\model;

class Employee
{

    function __construct()
    {
    }

    /**
     * Get the employee array 
     * @param type $id
     * @return type
     */
    function getEmployee($id = Null)
    {
        return Model::get()->employees();
    }

    /**
     * 
     * @param Integer $employeeId
     * @param Integer $departmentId
     * @return Array List of employees 
     */
    public function getEmployeeUnderMe($employeeId, $departmentId): array
    {
        $employees =  Model::get()->employeeUnderMe($employeeId, $departmentId);
        $ids = $this->getEmployeeIdsUnderMe($employees);
        echo "<br/><br/> Ids Under Employee role: Employe - {$employeeId} Department - {$departmentId}<br/><br/>";

        return $ids;
    }

    /**
     * Generate a simple organogram with hierarchy and print the output.
     * 
     * @param Integer $employeeId
     * @param Integer $departmentId
     */
    public function drowOrganogram($employeeId, $departmentId): void
    {
        $employees =  Model::get()->employeeUnderMe($employeeId, $departmentId);
        $levels = $this->getEmployeeLevelsUnderMe($employees);

        // Tree View 1
        $this->generateEmployeeTreeViewOne($levels, $employeeId, $departmentId);
        // Tree View 2
        $this->generateEmployeeTreeViewTwo($levels, $employeeId, $departmentId);
    }

    /**
     * Generate a simple tree with hierarchy and print the output.
     * 
     * @param Array $levels
     */
    private function generateEmployeeTreeViewOne($levels, $employeeId, $departmentId): void
    {
        echo "<br/><br/>Tree view 1 for: Employee - {$employeeId} Department - {$departmentId}<br/><br/>";

        foreach ($levels as $key => $nodes) {
            echo "{$key}<br/>";
            foreach ($nodes as $key => $node) {
                echo "&nbsp;{$node['name']} (id:{$node['id']})<br/>";
            }
        }
    }

    /**
     * Generate a lavel based tree with hierarchy and print the output.
     * 
     * @param Array $levels
     * @param Integer $employeeId
     * @param Integer $departmentId
     */
    private function generateEmployeeTreeViewTwo($levels, $employeeId, $departmentId): void
    {
        $department = Model::get()->department($departmentId);
        $totalNodes = $this->getTotalNodesFromLargestLevel($levels);

        // Every Node contaings 10 characters
        $totalSpace = ($totalNodes * 10);

        // Print the organogram top section(Department, Logged in employee information)
        echo "<br/><br/>Tree view 2 for: Employee - {$employeeId} Department - {$departmentId} <br/><br/>";
        echo str_pad($department['name'], $totalSpace, ".", STR_PAD_BOTH) . "<br/><br/>";
        echo str_pad("Em-{$employeeId}", $totalSpace, ".", STR_PAD_BOTH) . "<br/><br/>";

        // Generate tree lavels
        foreach ($levels as $nodes) {
            $line = "";
            // Level nodes
            foreach ($nodes as $key => $node) {
                $word = "Em-{$node['id']}";
                //check the last node
                if ($key != count($nodes) - 1) {
                    $word = str_pad($word, 10, '.', STR_PAD_RIGHT);
                }
                // Create a lavel with nodes
                $line .= $word;
            }
            echo str_pad(trim($line), $totalSpace, ".", STR_PAD_BOTH) . "<br/><br/>";
        }
    }

    /**
     * Returns every customers id of the tree where that's role under the loging employee 
     * 
     * @param Array $employees
     * @return Array
     */
    private function getEmployeeIdsUnderMe($employees): array
    {
        $ids = [];
        foreach ($employees as $employee) {
            $ids[] = $employee['id'];
        }

        return $ids;
    }

    /**
     * Returns every levels of the tree where that's role under the logged in employee 
     * 
     * @param Array $employees
     * @return Array
     */
    private function getEmployeeLevelsUnderMe($employees): array
    {
        $levels = [];
        foreach ($employees as $employee) {
            $levels[$employee['role']][] = $employee;
        }

        return $levels;
    }

    /**
     * Return total number of nodes from the largest level of the tree
     * 
     * @param Array $levels
     * @return Integer
     */
    private function getTotalNodesFromLargestLevel($levels): int
    {
        $size = 0;
        foreach ($levels as $array) {
            if (count($array) > $size) {
                $size = count($array);
            }
        }

        return $size;
    }
}
