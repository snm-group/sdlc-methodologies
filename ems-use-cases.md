# EMS Architecture — Use Case Specifications

This document outlines the complete set of use cases for the Employee Management System (EMS), organized by functional module. Each use case is defined with primary actors, goal, preconditions, flows, and exception paths.

---

## 1. Module: Data Onboarding & Migration

### UC-01: Import Employee Spreadsheet

- **Primary Actor:** HR Admin
- **Goal:** Migrate historical employee data from legacy Google Spreadsheets into the EMS database.
- **Preconditions:**
  - HR Admin is authenticated with administrative privileges.
  - Google Spreadsheet data is exported as a CSV or `.xlsx` file.
- **Main Success Scenario:**
  1. HR Admin navigates to the Data Migration page and selects the spreadsheet file to upload.
  2. System parses file headers and maps them to EMS data fields (e.g., `Full Name`, `DOB`, `Salary History`).
  3. HR Admin reviews and confirms column mappings.
  4. System validates all rows for required fields, data types, and unique constraints (e.g., email address).
  5. System creates corresponding employee records, work histories, salary entries, and certifications in the database.
  6. System displays a migration summary report (e.g., "50 records imported successfully").
- **Exception Flows:**
  - **E-1: Malformed File** — System detects corrupted or unreadable file format; displays error message: _"Invalid file structure."_ and aborts.
  - **E-2: Partial Validation Failure** — System identifies rows with invalid or missing mandatory data (e.g., malformed email on Row 12):
    1. System imports all valid rows.
    2. System skips invalid rows and logs exact error causes per row.
    3. System prompts HR Admin to download an Error Summary CSV for failed rows.

---

## 2. Module: Core Profile & History Management

### UC-02: View Employee 360° Profile

- **Primary Actor:** HR Admin, BOD / Executive, Line Manager, Employee
- **Goal:** Provide a comprehensive, consolidated single-page overview of an employee's data.
- **Preconditions:** User is authenticated and possesses appropriate role permissions.
- **Main Success Scenario:**
  1. User selects an employee from the directory or search results.
  2. System retrieves profile data filtered by user role permissions:
     - **BOD / HR Admin:** Full view including personal info, full salary history, title history, education, skills, and certifications.
     - **Line Manager:** Personal info, department, title history, skills, and certifications (Salary hidden).
     - **Employee:** Self-view of personal details, current salary, title history, and skills.
  3. System renders the 360° profile dashboard organized into structured tabs.
- **Exception Flows:**
  - **E-1: Unauthorized Access** — If a non-authorized user attempts to access an employee profile outside their permission scope, the system denies access and displays: _"Access Restricted."_

---

### UC-03: Create / Update Employee Record

- **Primary Actor:** HR Admin
- **Goal:** Register a new employee or update personal, education, skill, and certification information.
- **Preconditions:** HR Admin is logged into the system.
- **Main Success Scenario:**
  1. HR Admin accesses the employee creation/edit form.
  2. HR Admin enters or updates personal details, contact info, skills, and education.
  3. System validates input formats (e.g., phone number, email address, national ID).
  4. HR Admin submits the form.
  5. System updates the employee record and writes an entry to the system audit log.
- **Exception Flows:**
  - **E-1: Duplicate Email / National ID** — System flags duplicate identity records and prevents form submission until resolved.

---

### UC-04: Record Work & Salary History

- **Primary Actor:** HR Admin
- **Goal:** Track historical timeline updates such as promotions, salary revisions, transfers, and contract renewals.
- **Preconditions:** Target employee record exists in the system.
- **Main Success Scenario:**
  1. HR Admin selects an employee and navigates to the "Career & Compensation" tab.
  2. HR Admin clicks "Add Event" and selects the event type (e.g., _Salary Increment_, _Promotion_, _Department Transfer_).
  3. HR Admin inputs effective date, new title/salary amount, and notes.
  4. System updates current active details if the effective date is immediate or marks it pending for future activation.
  5. System records event entry into historical timeline logs.

---

## 3. Module: Directory & Search

### UC-05: Multi-Criteria Directory Search

- **Primary Actor:** HR Admin, BOD / Executive, Line Manager
- **Goal:** Fast-query and filter employees based on complex combinations of operational parameters.
- **Preconditions:** User is authenticated.
- **Main Success Scenario:**
  1. User opens the Employee Directory page.
  2. User inputs search criteria using single or multiple combined filters (e.g., `Department = Engineering`, `Skill = Node.js`, `Tenure > 2 Years`).
  3. System queries indexed employee data and returns matching results in real time.
  4. User can click an employee row to navigate to their 360° Profile (UC-02).

---

## 4. Module: System Administration & Security

### UC-06: Manage Roles & Data Masking Policies

- **Primary Actor:** System Administrator
- **Goal:** Define dynamic role permissions and security rules governing field-level visibility (e.g., hiding salary details from non-executive roles).
- **Preconditions:** System Administrator is logged in.
- **Main Success Scenario:**
  1. System Admin accesses Security & Permissions settings.
  2. System Admin defines role capabilities (e.g., HR Admin, BOD, Manager, Employee) and field-level permissions.
  3. System Admin updates access policy rules.
  4. System immediately enforces new data visibility controls across all UI components and API endpoints.
