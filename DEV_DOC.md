# 🛠️ Developer Documentation - Inception Internal

This document provides the technical instructions for developers to set up, build, and maintain the **Inception** infrastructure.

---

## ⚙️ 1. Environment Setup

Before building the stack, the host environment must be configured to meet the project's networking and security requirements.

### Prerequisites
| Requirement | Specification |
| :--- | :--- |
| **Operating System** | Debian 12 (Bookworm) or a compatible Linux distribution |
| **Orchestrator** | Docker Engine & Docker Compose Plugin |
| **Build Tool** | GNU Make |
| **Permissions** | Sudo/Root privileges for volume creation and networking |

### Step 1: Domain Mapping
The infrastructure relies on a specific local domain. Map it in your host's `/etc/hosts` file:
```bash
127.0.0.1 kben-tou.42.fr
```

### Step 2: Configuration Files (.env)
Create a `.env` file in the `srcs/` directory with the following structure:

- `DB_NAME` — database name
- `DB_USER` — database username
- `WP_ADMIN` — WordPress admin login
- `WP_EMAIL` — WordPress admin email
- `FTP_USER` — FTP login username

### Step 3: Secrets Initialization
To ensure security, sensitive passwords must be stored as plain text files within the `./secrets/` directory at the project root. Create the following files:
* `secrets/db_password.txt`
* `secrets/db_root_password.txt`
* `secrets/wp_password.txt`
* `secrets/ftp_password.txt`

---

## 🏗️ 2. Build and Launch

The project lifecycle is managed entirely through a **Makefile** that orchestrates the `docker-compose.yml` file.

| Command | Action |
| :--- | :--- |
| **make** | Builds the Docker images from the `Dockerfiles` and starts all containers. |
| **make down** | Stops and removes containers while keeping the data volumes. |
| **make start** | Start all stoped containers. |
| **make stop** | Stop all running containers. |
| **make re** | Forces a full rebuild of the infrastructure. |
| **make fclean** | **Danger:** Removes all containers, networks, images, and **permanently deletes volumes**. |

---

## 📦 3. Container & Volume Management

Developers can use the following commands to inspect or debug the microservices mesh.

### Status Verification
Check the health and uptime of all microservices:
```bash
docker ps
```

### Shell Access
To enter a container's isolated environment:
```bash
docker exec -it <container_name> /bin/bash
```

### Volume Inspection
To verify that Docker is correctly managing the persistence layer:
```bash
docker volume ls
docker volume inspect <volume_name>
```

---

## 💾 4. Data Storage & Persistence

Data persistence is handled via **Volumes**, ensuring that information survives container destruction and is easily accessible for backups on the host.

### Persistence Logic
| Service | Data Type | Host Path |
| :--- | :--- | :--- |
| **MariaDB** | SQL Database Files | `/home/kben-tou/data/db` |
| **WordPress** | Website Files & Media | `/home/kben-tou/data/wordpress` |
