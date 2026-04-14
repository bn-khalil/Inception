*This project has been created as part of the 42 curriculum by **[kben-tou]**.*

# 🐳 Inception - System Administration

## 📝 Description
The **Inception** project is a high-level system administration challenge. The goal is to design a robust, multi-service infrastructure using **Docker Compose**. Unlike standard container usage, this project mandates building every image from a "clean" OS (**Debian 12**) to ensure a deep understanding of process isolation, networking, and storage persistence.

The architecture is built as a **Microservices Mesh**, where each service is isolated in its own environment with restricted privileges, communicating only through an encrypted and private internal network.

## 🚀 Instructions

### 1. Prerequisites
* Root or sudo privileges to change some settings.
* Linux environment (Debian/Alpine recommended).
* Docker, Docker Compose, and `make` installed.

### 2. Domain Setup
Add the following mapping to your `/etc/hosts` file:
```bash
127.0.0.1  kben-tou.42.fr
```

### 3. Execution
Run the following command at the root of the project:
```bash
make
```

## 🧠 Design Choices & Technical Logic

### 1. Virtual Machines vs Docker (Kernel-Level Isolation)
Virtual Machines simulate an entire computer including the OS (heavy), while Docker shares the host’s kernel to stay lightweight and fast.

### 2. Secrets vs Environment Variables (The Security Layer)
Environment variables are easily visible in logs and system checks, but Secrets are securely stored in temporary memory (RAM) for better protection.

### 3. Docker Volumes vs Bind Mounts (The Persistence Strategy)
Bind mounts link a direct path from your computer to the container, while Volumes are managed by Docker for more flexible and portable data storage.

### 4. Docker Network vs Host Network (Network Topology)
Host network shares the host IP directly with zero isolation. Bridge network creates a private, secure tunnel to hide and protect your containers.

## 🛠️ Detailed Service Breakdown

### 🛡️ NGINX
Acts as the **TLS Termination Proxy**. It handles HTTPS requests (Port 443), enforces SSL/TLS protocols, and forwards dynamic requests to PHP-FPM via the **FastCGI** protocol.

### 🐘 WordPress & PHP-FPM
The dynamic core. We use **PHP-FPM** as a standalone service for better process management. It processes WordPress logic and communicates with MariaDB for data retrieval.

### 🗄️ MariaDB
The **Relational Database**. It ensures data integrity and is strictly isolated, accepting connections only from within the private bridge network.

### ⚡ Redis (Bonus)
A high-performance **In-memory data store** used as an **Object Cache** to reduce database queries and improve response times significantly.

### 📁 vsftpd (Bonus)
A **Secure FTP Server** providing a dedicated gateway for secure file management (themes/plugins) without needing direct shell access to the host.

### 🔍 Adminer (Bonus)
A **Minimalist Database Management tool**. It provides a full GUI to manage MariaDB tables via a single-file PHP script, keeping the container footprint minimal.

### 🖥️ Static Website (Bonus)
A **Centralized Landing Page** that serves as the entry point for your infrastructure. it provides a clean UI with direct links to all your services (WordPress, Adminer), improving user experience and service discovery.

### 📁 File Browser (Bonus)
A **Web-based File Manager** that allows you to manage your Docker volumes directly from the browser. It provides an easy way to upload, download, or edit WordPress files and database backups without using the terminal.

## 📚 Resources

### 🐳 Core Infrastructure
* **Docker Deep Dive** by Nigel Poulton (The "Bible" for understanding the Engine).
* **The Docker Components:** [Sysdig Guide](https://www.sysdig.com/learn-cloud-native/docker-101-the-docker-components)
* **Docker Certified Associate (DCA):** [KodeKloud Study Notes](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Introduction/Course-Introduction/page).

### 🛠️ Service Specific Documentation
* **NGINX:** [Official Documentation](https://nginx.org/en/docs/) - Focused on TLS/SSL & FastCGI Proxying.
* **WordPress:** [WP-CLI Handbook](https://make.wordpress.org/cli/handbook/guides/installing/) - For automated setup via scripts.
* **MariaDB:** [MariaDB Knowledge Base](https://mariadb.com/kb/en/documentation/) - For security hardening and SQL dumps.
* **Redis:** [Redis Object Cache](https://github.com/tillkruss/redis-cache) - Understanding the integration with WordPress.
* **FTP (vsftpd):** [Smallfootprint FTPd](https://security.appspot.com/vsftpd.html) - For secure file transfer configurations.
* **Adminer:** [Official Lightweight DB Management](https://www.adminer.org/) - Design and implementation.

## 🤖 AI Usage

AI used for:
* **Debugging:** NGINX configuration errors and FastCGI protocol mismatches.
* **Review:** To review the Dockerfile optimization strategies and ensure compliance with best practices.
* **Documentation** To structure and write the project's README for a clear, professional presentation of the infrastructure.