class Employee:

    raise_amount = 1.04  # this is a class variable
    employee_amount = 0

    def __init__(self, first, last, pay):  # this is a constructor
        self.first = first
        self.last = last
        self.pay = pay
        self.email = first + '.' + last + '@company.com'
        Employee.employee_amount += 1

    def fullName(self):  # this is a method
        return ("{} {}".format(self.first, self.last))

    def applyRaise(self):
        self.pay = int(self.pay * self.raise_amount)
        # could be Employee.raise_amount if class value is used

    # class methods are SUPPOSED to be ONLY called by classes.
    @classmethod  # this is a class method
    def set_raise_amount(cls, amount):
        Employee.raise_amount = amount  # class value is changed.

    @classmethod  # this is an alternative constructor
    def new_alternative_employee(cls, emp_str):
        first, last, pay = emp_str.split("-")
        return cls(first, last, int(pay))

    # use static method if you're not going to access the class/instance
    @staticmethod  # this is a static method
    def is_workday(day):
        if day.weekday() == 5 or day.weekday() == 6:  # 0-4, weekdays
            return "It is non-working day."
        return "It is working day."


class Developer(Employee):  # this is a sub-class that inherits from Employee
    raise_amount = 1.10

    def __init__(self, first, last, pay, prog_lang):
        # passing variables to the parent's constructor
        super().__init__(first, last, pay)
        self.prog_lang = prog_lang


class Manager(Employee):

    def __init__(self, first, last, pay, employees=None):
        super().__init__(first, last, pay)
        if employees is None:
            self.employees = []
        else:
            self.employees = employees

    def add_emp(self, emp):
        if emp not in self.employees:
            self.employees.append(emp)

    def remove(self, emp):
        if emp in self.employees:
            self.employees.remove(emp)

    def print_emps(self):
        for emp in self.employees:
            print("---", emp.fullName())


if __name__ == "__main__":
    emp1 = Employee("Jedidiah", "Calayag", 90000)
    emp2 = Employee("Mariah", "Garcia", 90000)

    print("Full name - {}".format(emp1.fullName()))

    print("Raising raise value...")
    print("Old raise value - {}".format(Employee.raise_amount))
    Employee.set_raise_amount(1.09)  # class value is changed.
    emp1.raise_amount = 1.05  # instance value is changed.

    print("New global raise value: {}".format(Employee.raise_amount))
    print("New specific raise value: {}".format(emp1.raise_amount))

    print("Applying raise...")
    print("Old Salary - {}".format(emp1.pay))
    emp1.applyRaise()
    print("New Salary - {}".format(emp1.pay))

    # checking the attributes of emp1
    print("Attributes - {}".format(emp1.__dict__))

    print("# of employees: {}".format(Employee.employee_amount))

    print("Hiring a new employee...")
    emp3 = Employee.new_alternative_employee("John-Doe-70000")
    print("Name of new employee: {}".format(emp3.fullName()))

    print("Updated # of employees: {}".format(Employee.employee_amount))

    import datetime
    my_date = datetime.date(2016, 7, 10)  # year, month, day
    print(Employee.is_workday(my_date))

    print("Hiring 2 new developers...")
    dev1 = Developer("Stacey", "Miroro", 100000, "Python")
    dev2 = Developer("Wewers", "Mirora", 100000, "Java")

    print("1st Developer: {}".format(dev1.fullName()))
    print("2nd Developer: {}".format(dev2.fullName()))

    print("Applying raise of 2nd developer...")
    print("Old pay - {}".format(dev2.pay))
    dev2.applyRaise()
    print("Updated pay - {}".format(dev2.pay))

    print("Language of 1st developer - {}".format(dev1.prog_lang))
    print("Language of 2nd developer - {}".format(dev2.prog_lang))

    print("Hiring 1 new manager...")
    mgr1 = Manager("John", "Smith", 200000, [dev1])
    print("Manager name - {}".format(mgr1.fullName()))
    print("Developers under manager: ")
    mgr1.print_emps()

    print("Added Wewers Mirora under manager...")
    mgr1.add_emp(dev2)
    print("Removed Stacey Miroro under manager...")
    mgr1.remove(dev1)

    print("Updated Developers under manager: ")
    mgr1.print_emps()
