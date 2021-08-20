<?php

use Organogram\employee;
use PHPUnit\Framework\TestCase;

class EmployeeTest extends TestCase
{
    /**
     * Returns the test data
     * @return Array
     */
    public function testProvider(): array
    {
        $data = array();
        $this->assertEmpty($data);

        $employee = new Employee;
        $data['employees'] = $employee->getEmployee();
        $data['employeeunderme'] = $employee->getEmployeeUnderMe(1, 1);

        return $data;
    }

    /**
     * @depends testProvider
     */
    public function testCanBeCountTotlaRecordsInEmpoyeeTable($data)
    {
        $this->assertSame(25, count($data['employees']));
    }

    /**
     * @depends testProvider
     */
    public function testCanBeCountEmployeeUnderMe($data): void
    {
        $this->assertSame(19, count($data['employeeunderme']));
    }
}
