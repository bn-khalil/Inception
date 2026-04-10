*This project has been created as part of the 42 curriculum by [bn-bn].*

## 📝 Description
The ***Inception*** project is a high-level system administration challenge. The goal is to design a robust, multi-service infrastructure using Docker Compose. Unlike standard container usage, this project mandates building every image from a "clean" OS (Debian 12) to ensure a deep understanding of process isolation, networking, and storage persistence.

The architecture is built as a Microservices Mesh, where each service (Nginx, WordPress, MariaDB, Redis, FTP, Adminer) is isolated in its own environment with restricted privileges, communicating only through an encrypted and private internal network.
---

### 🧠 Design Choices & Comparisons

1. Virtual Machines vs Docker (Kernel-Level Isolation)
Virtual Machines: Virtualize the hardware layer. Each VM has its own Kernel, which leads to high overhead in RAM and CPU usage.

Docker: Virtualizes the Operating System layer. Containers share the Host Kernel but are isolated via Namespaces (for process/network visibility) and Cgroups (for resource limiting).

Choice: Docker was used because it provides a "Production-grade" environment that is lightweight, portable, and boots in milliseconds, unlike the minutes required by a VM.

2. Secrets vs Environment Variables (The Security Layer)
Env Variables: These are often logged in clear text, visible via docker inspect, and can be inherited by child processes.

Secrets: Secrets are stored outside the image and mounted as temporary files (often in a RAM disk /run/secrets/). They are only accessible to the specific service that needs them.

Choice: I implemented Docker Secrets for DB passwords and FTP credentials to ensure that sensitive data never touches the disk in an unencrypted form or appears in the process environment.

3. Docker Network vs Host Network (Network Topology)
Host Network: The container shares the host's IP and port space directly, removing any network isolation.

Docker Network (Bridge): Creates a virtual bridge (private subnet). Containers communicate using an Internal DNS provided by Docker.

Choice: I used a custom Bridge Network to ensure that services like MariaDB are completely hidden from the outside world. Only Nginx (Port 443) and FTP (Passive Ports) are exposed, reducing the attack surface.

4. Docker Volumes vs Bind Mounts (The Persistence Strategy)
Bind Mounts: Direct mapping of a host path to a container path. Highly dependent on the host's file structure.

Volumes: Managed by Docker, independent of the host directory structure, and provide better performance on non-Linux hosts.

The Hybrid Choice: I utilized a Named Volume mapped via Bind Mount options. This meets the project's requirement for data to exist at /home/bn-bn/data while allowing Docker to manage the volume lifecycle. Crucially, this setup allows for Volume Initialization: Docker copies existing data from the image to the host folder on the first run, preventing MariaDB/WordPress from starting with empty directories.
---

## 🛠️ Detailed Service breakdown

### 🛡️ NGINX
Acts as the **TLS Termination Proxy**. It is the only service exposed to the host machine. It strictly handles HTTPS requests (Port 443), enforces SSL/TLS protocols, and forwards dynamic content requests to PHP-FPM using the FastCGI protocol.

### 🐘 WordPress & PHP-FPM
The dynamic core of the infrastructure. Unlike standard setups where PHP is an Apache module, we use **PHP-FPM** as a standalone service. This separation allows for better process management and resource allocation. It processes WordPress logic and communicates with MariaDB for data retrieval.

### 🗄️ MariaDB
The **Relational Database Management System (RDBMS)**. It ensures data integrity and persistence. In this architecture, MariaDB is isolated from the outside world and only accepts connections from the WordPress and Adminer containers within the private network.

### ⚡ Redis (Bonus)
A high-performance **In-memory data structure store**. It functions as an Object Cache for WordPress, drastically reducing the number of database queries by storing frequently accessed data in RAM, resulting in near-instant page loads.

### 📁 vsftpd (Bonus)
A **Secure FTP Server** that provides a dedicated gateway for file management. It allows administrators to upload or modify WordPress assets (themes/plugins) securely without needing direct shell access to the host or container.

### 🔍 Adminer (Bonus)
A **Minimalist Database Management tool**. It replaces bulky alternatives like phpMyAdmin with a single-file PHP script, offering a full GUI to manage MariaDB tables while keeping the container footprint extremely small.
---

## 🚀 Instructions
1. **Prerequisites:** Linux, Docker, Docker Compose, and `make`.
2. **Domain:** Add `127.0.0.1 bn-bn.42.fr` to `/etc/hosts`.
3. **Execution:** Run `make all` at the root.

---

## 📚 Resources
- [Docker Deep Dive by Nigel Poulton]
- [Virtualization and Hypervisors](https://devanshagarwal121.medium.com/virtualization-and-hypervisors-9c4c8f4ab27d)
- [Docker](https://www.sysdig.com/learn-cloud-native/docker-101-the-docker-components)
- [Docker](https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Introduction/Course-Introduction/page)

### 🤖 AI Usage Disclosure