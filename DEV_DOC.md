<!DOCTYPE html>
<html lang="en">
<body>
    <h1>👨‍💻 DEVELOPER DOCUMENTATION</h1>

    <h2>⚙️ Environment Setup</h2>
    <p>To replicate this environment from scratch:</p>
    <ul>
        <li>Ensure <code>docker</code> and <code>docker-compose-plugin</code> are installed.</li>
        <li>Place your <code>.env</code> file in <code>srcs/</code> and password files in <code>srcs/secrets/</code>.</li>
        <li>Run <code>make</code>: The Makefile will execute <code>mkdir -p</code> for <code>/home/bn-bn/data/db</code> and <code>/home/bn-bn/data/wordpress</code> before launching.</li>
    </ul>

    <h2>🛠️ Makefile & Docker Compose Logic</h2>
    <p>
        The <strong>Makefile</strong> handles the orchestration lifecycle. It uses the <code>--env-file</code> flag to ensure consistent variable injection. 
        Images are named exactly as their services (e.g., <code>mariadb:latest</code>) and are built using <strong>BuildKit</strong> for optimized layering.
    </p>

    <h2>💾 Data Persistence & Storage</h2>
    <p>
        Data persistence is achieved through <strong>Bind Mounts</strong> mapped to <code>/home/bn-bn/data/</code>. 
        This path is chosen to survive container deletion and VM reboots. Even after a <code>docker compose down</code>, the MariaDB tables and WordPress uploads remain intact on the host disk.
    </p>

    <h2>🔍 Debugging Commands</h2>
    <ul>
        <li><strong>Check Network Isolation:</strong> <code>docker network inspect srcs_inception_network</code>.</li>
        <li><strong>Check Volume Path:</strong> <code>docker volume inspect wordpress_data</code>.</li>
        <li><strong>Logs:</strong> <code>docker compose -f srcs/docker-compose.yml logs -f</code>.</li>
    </ul>
</body>
</html>