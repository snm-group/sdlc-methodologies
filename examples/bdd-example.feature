Feature: Employee 360 Profile Access

    Scenario: Executive views complete employee profile including compensation
        Given I am logged in as a "BOD" user
        And an employee "John Doe" exists in the system with active salary records
        When I view the 360 profile for "John Doe"
        Then I should see personal details, career history, and education
        And I should see the "Salary History" tab with full compensation details

    Scenario: Line Manager views direct report profile without salary details
        Given I am logged in as a "Line Manager"
        And "John Doe" is a direct report in my department
        When I view the 360 profile for "John Doe"
        Then I should see personal details, skills, and certifications
        But the "Salary History" section should be hidden