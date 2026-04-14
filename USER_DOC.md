# 📖 Inception - User & System Documentation
*Administrator's Guide to the kben-tou.42.fr Infrastructure*

## 📋 1. Infrastructure Overview
This document provides the necessary instructions to manage and access the **Inception** multi-container environment. The stack is built on **Debian 12** and orchestrated via **Docker Compose**, ensuring high availability and service isolation.

### 🛠️ Service Catalog
| Service | Role | Access Point |
| :--- | :--- | :--- |
| **NGINX** | Secure Reverse Proxy (TLS 1.3) | `https://kben-tou.42.fr` |
| **WordPress** | Content Management System (PHP-FPM) | `https://kben-tou.42.fr` |
| **Adminer** | Database Management GUI | `https://kben-tou.42.fr/adminer` |
| **Static Site** | Landing Page | `https://kben-tou.42.fr/static` |
| **cAdvisor** | Container Metrics & Monitoring | `https://kben-tou.42.fr/cadvisor` |
| **FTP Server** | Secure File Management (vsftpd) | `ftp://kben-tou.42.fr:21` |
| **Redis** | In-memory Object Cache | *(Internal Service)* |
| **MariaDB** | Relational Database Engine | *(Internal Service)* |

## ⚙️ 2. Administrative Management
All infrastructure operations are centralized through the **Makefile** located at the root of the repository.

### 🚀 Deployment
To build images and initialize the stack in detached mode:
```bash
make build
```
(Note: `make` all or simply make will also trigger this process.)

### 🔄 Lifecycle Management
To manage the state of the containers without removing them:
* Start services:

```bash
make start
```

* Stop services:

```bash
make make stop
```

### 🛑 Termination
To stop all services and remove active containers while preserving data:
```bash
make down
```

### 🛑 🧹 Deep Clean (Reset)
To wipe all containers, networks, and permanently delete volumes:
```bash
make fclean
```

## 🌐 3. Accessing the Application

The infrastructure exposes services through a secure gateway. Use the following table to access the different parts of the stack:

| Service | Role | Access Point |
| :--- | :--- | :--- |
| **WordPress** | Main CMS Public Site | `https://kben-tou.42.42.fr` |
| **WP-Admin** | WordPress Administration Panel | `https://kben-tou.42.42.fr/wp-admin` |
| **Adminer** | Database Management GUI | `http://kben-tou.42.fr:8080` |
| **static site** | static site with landing page | `http://kben-tou.42.fr:81` |
| **File Browser** | Web-based Volume Management | `http://kben-tou.42.42.fr:8080` |


> [!NOTE]
> **SSL Certificate:** Since we use a self-signed certificate, you must manually accept the security warning in your browser to proceed to the HTTPS services.

---

## 🔐 4. Security & Credentials

The system strictly separates public configuration from sensitive secrets to ensure maximum security.

#### **A. Public Configuration (`srcs/.env`)**
These variables define the orchestration environment and are not encrypted:

- `DB_NAME` — database name
- `DB_USER` — database username
- `WP_ADMIN` — WordPress admin login
- `WP_EMAIL` — WordPress admin email
- `FTP_USER` — FTP login username

#### **B. Secure Secrets (`./secrets/`)**
Passwords are stored in isolated `.txt` files and mounted as **Docker Secrets** to prevent exposure in the environment:

- `**db_root_password.txt**` **MariaDB Root** - Full administrative access to the database.
- `**db_password.txt**`  **MariaDB User** - Authentication between WordPress and MariaDB.
- `**wp_password.txt**`  **WP Admin** - Login password for the WordPress administrator account.
- `**ftp_password.txt**`  **FTP User** - Password for the secure vsftpd file server.

## 🔐 4. Security & Credentials

### Status Verification
Check the health and uptime of all microservices:

```bash
docker ps
```