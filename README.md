# SPLWD: Student Profiling for Learners with Disabilities System Upgrade

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PHP Version](https://img.shields.io/badge/PHP-8.0%2B-blue.svg)](https://php.net)
[![MySQL Version](https://img.shields.io/badge/MySQL-8.0%2B-orange.svg)](https://mysql.com)
[![Tests](https://img.shields.io/badge/Tests-220%20passed-green.svg)](./tests)

## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [System Architecture](#system-architecture)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Project Description

The SPLWD (Student Profiling for Learners with Disabilities) System Upgrade is a comprehensive modernization of an existing web-based student profiling system. This upgraded system serves the Sta. Cruz District of Laguna, specifically designed to digitize and centralize the management of LWD (Learners with Disabilities) student records, replacing traditional paper-based filing systems that are vulnerable to natural disasters.

The system provides a secure, role-based platform for managing student profiles, educational documents, progress tracking, and parent engagement across multiple elementary schools in the district, including Sta. Cruz Central Elementary School, Bagumbayan Elementary School, and Gatid Elementary School.

### Objectives

- Modernize legacy codebase with PHP 8.x and current best practices
- Improve system performance, security, and maintainability
- Enhance user interface and experience
- Implement comprehensive testing with PHPUnit
- Ensure compliance with data privacy regulations

## Features

### Core System Features

- **Student Profile Management**: Digital storage and retrieval of LWD student information including personal details, enrollment status, and educational history
- **Document Management**: Upload, storage, and organization of educational documents including IEP (Individual Educational Plan), ILP (Individual Learner's Profile), ILMP (Individual Learning Monitoring Plan), and BIR (Behavior Intervention Report)
- **Progress Tracking**: Quarterly assessment and monitoring with chart visualizations for student development
- **Multi-user Support**: Role-based access control for Administrators, District Administrators, Principals, Secretaries, Teachers, and Parents
- **Reporting**: Comprehensive enrollment reports, progress summaries, and audit logs
- **Parent Engagement**: Limited access for parents to view child's progress and submit observations

### Upgrade Enhancements

#### Code Quality Improvements
- Codebase cleaning: Removed redundant and unused code segments
- Refactoring: Implemented modern design patterns (MVC, Repository, Factory)
- Code standards: Consistent naming conventions and formatting
- Improved scalability: Enhanced compatibility for future upgrades and newer technologies

#### Security Enhancements
- Environment configuration: Moved hardcoded credentials to .env files
- Secure authentication and authorization mechanisms
- Data encryption for sensitive information
- Compliance with Data Privacy Act requirements

#### UI/UX Improvements
- Modern interface: Updated typography, padding, and element positioning
- Responsive design: Mobile-friendly interface using Bootstrap
- Streamlined workflows: Improved navigation and user experience

## System Architecture

The SPLWD system follows a three-tier web application architecture:

### Presentation Layer
- Responsive web interface built with HTML5, CSS3, and JavaScript
- Bootstrap framework for consistent UI/UX design
- Role-based dashboards for different user types (Admin, District Admin, Principal, Secretary, Teacher, Parent)

### Application Layer
- PHP 8.x backend with MVC architecture pattern
- RESTful API design for data operations
- Session management and authentication middleware
- File upload and document processing capabilities

### Data Layer
- MySQL database with normalized schema design
- Secure file storage system for document management
- Automated backup and recovery mechanisms

## Technologies Used

### Backend Technologies
- **PHP 8.x**: Modern language features and performance improvements
- **MySQL 8.x**: Primary data storage with InnoDB engine for ACID compliance
- **Composer**: Dependency management and PSR-4 autoloading
- **PDO**: Database abstraction layer for security and portability
- **PHPOffice/PHPWord**: Document generation and processing

### Frontend Technologies
- **HTML5**: Semantic markup structure
- **CSS3**: Modern styling with responsive design
- **Bootstrap 5.x**: Responsive CSS framework
- **JavaScript (ES6+)**: Dynamic interactions and functionality
- **jQuery 3.x**: DOM manipulation and AJAX operations
- **Chart.js**: Data visualization and progress charts
- **Font Awesome**: Consistent icon library

### Development & Testing Tools
- **PHPUnit**: Automated testing framework (220 test cases, 962 assertions)
- **Git**: Version control system
- **Environment Variables**: Configuration management via .env files

### System Requirements
- **CPU**: 2 cores, 2.4 GHz
- **RAM**: 4 GB minimum, 8 GB recommended
- **Storage**: 10 GB available space
- **Network**: Stable internet connection
- **Software**: PHP >= 8.0, MySQL >= 8.0, Apache >= 2.4 or Nginx >= 1.18, Composer >= 2.0

## Installation

### Prerequisites
Ensure the following software is installed on your system:
- PHP 8.0 or higher
- MySQL 8.0 or higher
- Apache 2.4+ or Nginx 1.18+
- Composer 2.0+

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/VoxDroid/SPLWD.git
   cd SPLWD
   ```

2. **Install Dependencies**
   ```bash
   composer install
   ```

3. **Environment Configuration**
   ```bash
   cp .env.example .env
   # Edit .env file with your database credentials
   ```

4. **Database Setup**
   The application automatically creates the database and imports the schema on first run. Ensure your MySQL server is running and credentials are configured in `.env`.

   If you prefer manual setup:
   - Create a new MySQL database named `sc_district`
   - Create a database user with appropriate privileges
   - The schema will be imported automatically on app start

5. **Configure Environment Variables**
   Update the `.env` file with your database connection details:
   ```
   DB_PASSWORD=Your_Database_Password
   DB_SERVERNAME=localhost
   DB_USERNAME=your_db_user
   DB_NAME=sc_district
   ```

6. **File Permissions**
   Set appropriate permissions for web server access:
   ```bash
   sudo chown -R www-data:www-data /path/to/SPLWD
   sudo chmod -R 755 /path/to/SPLWD
   ```

## Usage

### User Roles and Permissions

1. **System Administrator**: Full system access and user management
2. **District Administrator**: District-level oversight and multi-school management
3. **School Principals**: School-level oversight and reporting
4. **Principal's Secretary**: User account management and administrative support
5. **Teachers**: Student data entry, document upload, and progress tracking
6. **Parents/Guardians**: Limited access to view child's progress and add observations

### Running the Application

For development:
```bash
php -S localhost:8000
```

For production, deploy to a web server with PHP support.

### Key Workflows

- **Student Enrollment**: Teachers and administrators can create and manage student profiles
- **Document Upload**: Secure upload and storage of educational documents
- **Progress Monitoring**: Quarterly assessments with visual progress tracking
- **Reporting**: Generate comprehensive reports for stakeholders
- **Parent Communication**: Parents can view progress and submit feedback

## Testing

The project includes comprehensive testing with PHPUnit:

- **Total Test Cases**: 220
- **Total Assertions**: 962
- **Test Success Rate**: 100%
- **Code Coverage**: >98% for critical components

### Running Tests

```bash
# Run full test suite
composer test

# Run specific test file
./vendor/bin/phpunit tests/specific_test_file.php
```

### Test Categories
- Unit Tests: Individual component validation
- Integration Tests: Database and API interaction verification
- Functional Tests: End-to-end user workflow testing
- Security Tests: Authentication and authorization validation

## Project Structure

```
SPLWD/
├── CODE_OF_CONDUCT.md          # Code of conduct guidelines
├── CONTRIBUTING.md             # Contribution guidelines
├── LICENSE                     # MIT License
├── README.md                   # This file
├── SECURITY.md                 # Security policy
├── SUPPORT.md                  # Support information
├── composer.json               # PHP dependencies
├── composer.lock               # Locked dependency versions
├── docs/
│   ├── SRS.md                  # Software Requirements Specification
│   └── TechnicalDocumentation.md # Technical documentation
├── phpunit.xml                 # PHPUnit configuration
├── src/
│   ├── .env                     # Environment configuration (gitignored)
│   ├── .env.example             # Environment configuration template
│   ├── .phpunit.result.cache    # PHPUnit test cache
│   ├── add_account.php
│   ├── admin/                   # Administrator interface
│   ├── composer.json
│   ├── composer.lock
│   ├── connect.php              # Database connection
│   ├── css/                     # Stylesheets
│   ├── database/
│   │   └── sc_district.sql      # Database schema
│   ├── district_admin/          # District administrator interface
│   ├── dompdf/                  # PDF generation library
│   ├── forgot_password.php
│   ├── img/                     # Images and assets
│   ├── index.php                # Main entry point (includes auto DB init)
│   ├── init_database.php        # Automatic database initialization
│   ├── js/                      # JavaScript files
│   ├── logout.php
│   ├── Mail/                    # Email handling library
│   ├── nav.php                  # Navigation component
│   ├── otp_verification.php
│   ├── parent/                  # Parent interface
│   ├── phpunit.xml              # PHPUnit configuration
│   ├── principal/               # Principal interface
│   ├── reset_password.php
│   ├── scss/                    # SCSS source files
│   ├── secretary/               # Secretary interface
│   ├── session.php              # Session management
│   ├── signup.php
│   ├── sms.php
│   ├── teacher/                 # Teacher interface
│   ├── tests/                   # PHPUnit test files
│   └── vendor/                  # Composer dependencies
```

## Changelog

### Version 2.0 (December 23, 2025)
- **Automatic Database Initialization**: Implemented `init_database.php` for seamless DB creation and schema import on app start
- **Repository Cleanup**: Removed 30+ redundant/unused files (e.g., accomplishment_print.php, htmlTodoc.class.php, duplicate files, unused images)
- **Code Quality Improvements**: Fixed broken paths, typos in image references, and inconsistent JS includes
- **Configuration Updates**: Updated `.env.example` with proper database keys and environment variables
- **Documentation Overhaul**: Professionalized README with comprehensive sections, removed emojis, added architecture details
- **Testing**: Maintained 220 passing tests with 100% success rate

## Contributing

We welcome contributions to the SPLWD project! Please read our [Contributing Guidelines](CONTRIBUTING.md) for details on how to submit pull requests, report issues, and contribute to the codebase.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests: `composer test`
5. Submit a pull request

## License

This project is licensed under the [MIT License](LICENSE). See the LICENSE file for details.

## Contact

For technical support, bug reports, or feature requests:

- **Email**: izeno.contact@gmail.com
- **Project Repository**: [github.com/VoxDroid/SPLWD](https://github.com/VoxDroid/SPLWD)
- **Documentation**: See `/docs` folder for detailed SRS and technical documentation

---

**Last Updated**: December 23, 2025  
**Version**: 2.0  
**Status**: Production Ready
