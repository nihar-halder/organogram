<?php

namespace Organogram;
include_once 'config.php';

class Model
{

    /**
     * @var MySQLi Object  
     */
    private $_dbcon;

    /**
     * Constructor 
     */
    public function __construct()
    {
        $this->_dbcon = new \MySQLi(env('DB_HOST', 'localhost'), env('DB_USER', 'dbuser'), env('DB_PASSWORD', 'password'), env('DB_NAME', 'dbname'));

        if ($this->_dbcon->connect_error) {
            die("Connection failed: " . $this->_dbcon->connect_error);
        }
    }


    /**
     * Static method get the Model Object 
     * @return \Organogram\Model
     */
    public static function get()
    {
        return new Model();
    }

    /**
     * Query : Execute the base query 
     * @param String $sql
     * @return mixed 
     */
    private function query($sql)
    {
        return $this->_dbcon->query($sql);
    }

    /**
     * fetch : get the first result 
     * @param mixed $result
     * @return Array
     */
    private function fetch($result)
    {
        $data = $result->fetch_assoc();
        $result->free_result();
        $this->_dbcon->close();
        return $data;
    }
    /**
     * fetchAll : get the full result of query
     * @param type $result
     * @return type
     */
    private function fetchAll($result)
    {
        $data = $result->fetch_all(MYSQLI_ASSOC);
        $result->free_result();
        $this->_dbcon->close();
        return $data;
    }

    /**
     * employee: get the employee data
     * @param type $id
     * @return type
     */
    public function employees($id = false)
    {
        $where = $id ? "WHERE id='{$id}'" : "";
        $sql = "SELECT * FROM employee {$where}";
        $result = $this->query($sql);
        if ($id) {
            $data = $this->fetch($result);
        } else {
            $data = $this->fetchAll($result);
        }

        return $data;
    }

    /**
     * Returns the role data
     * @param type $id
     * @return type
     */
    public function roles($id = false)
    {
        $sql = "SELECT * FROM role";
        $result = $this->query($sql);
        if ($id) {
            $data = $this->fetch($result);
        } else {
            $data = $this->fetchAll($result);
        }
        return $data;
    }

    /**
     * Returns the department data
     * @param type $id
     * @return type
     */
    public function department($id = false)
    {
        $where = $id ? "WHERE id='{$id}'" : "";
        $sql = "SELECT * FROM department {$where}";
        $result = $this->query($sql);
        if ($id) {
            $data = $this->fetch($result);
        } else {
            $data = $this->fetchAll($result);
        }
        return $data;
    }

    /**
     * employeeUnderMe: get thouse employes who are belong to my position
     * @param Integer $employeeId
     * @param Integer $departmentId
     * @return Array List of employees 
     */

    public function employeeUnderMe($employeeId, $departmentId)
    {
        $colums = "employee.id,employee.name,employee.email,role.id role_id,role.priority_id priority,role.name role,department.name department";

        $subQuery = "SELECT role2.priority_id 
                    FROM `department_employee_role_relation` AS relation2 
                    JOIN role AS role2 ON relation2.role_id = role2.id 
                    WHERE employee_id = '{$employeeId}' AND department_id = '{$departmentId}'";

        $sql = "SELECT {$colums} FROM `department_employee_role_relation` AS relation 
                LEFT JOIN role ON relation.role_id = role.id 
                LEFT JOIN employee ON relation.employee_id = employee.id 
                LEFT JOIN department on relation.department_id = department.id 
                WHERE role.priority_id > ({$subQuery}) AND department_id = '{$departmentId}'
                ORDER BY role.priority_id ASC";

        $result = $this->query($sql);
        $data = $this->fetchAll($result);

        return $data;
    }
}
