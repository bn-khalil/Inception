<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <p><i>This project has been created as part of the 42 curriculum by [bn-bn].</i></p>

    <h1>📝 Project Description: The Inception Architecture</h1>
    <p>
        The <strong>Inception</strong> project is a rigorous system administration challenge focused on high-density virtualization. The goal is to build a secure, persistent, and modular infrastructure using <strong>Docker</strong> and <strong>Docker Compose</strong>. 
        Unlike basic containerization, this project mandates building custom images from a clean <strong>Debian 12 (Bookworm)</strong> base, ensuring that every layer of the software stack is understood, configured, and optimized manually.
    </p>

    <h2>🏗️ Design Choices & Structure</h2>
    <h3>Directory Structure Pertinence</h3>
    <p>
        The project is organized under a <code>srcs/</code> directory to strictly decouple the infrastructure's <strong>source code</strong> (Dockerfiles, configurations, scripts) from the <strong>orchestration</strong> (Makefile). 
        This structure ensures that the build context is clean and that sensitive configuration files are isolated from the root of the repository.
    </p>

    <h3>Docker vs. Virtual Machines</h3>
    <p>
        While VMs virtualize the hardware layer (running a full kernel and emulating devices), <strong>Docker</strong> virtualizes the Operating System. It uses Linux <strong>Namespaces</strong> for isolation and <strong>Cgroups</strong> for resource management, sharing the host's kernel. 
        The benefit is a sub-second boot time, significantly lower RAM overhead, and "write once, run anywhere" portability.
    </p>

    <h3>Docker Image: With vs. Without Compose</h3>
    <p>
        Using a Docker image <strong>without Compose</strong> requires manual orchestration (manual network bridging, volume mounting, and environment injection via long CLI commands). 
        <strong>Docker Compose</strong> provides a <strong>Declarative Workflow</strong>; it allows us to define the entire "desired state" of the infrastructure in a YAML file, handling service dependencies and internal DNS discovery automatically.
    </p>

    <h2>🛡️ Security & Technical Comparisons</h2>
    <table border="1">
        <tr>
            <th>Feature</th>
            <th>Technical Comparison</th>
            <th>Implementation in Inception</th>
        </tr>
        <tr>
            <td><strong>Secrets vs Env Variables</strong></td>
            <td>Env variables are visible via <code>docker inspect</code> and process logs. Secrets are mounted as secure, temporary files.</td>
            <td><strong>Docker Secrets</strong> were used for DB and FTP credentials to ensure sensitive data never leaks into the container environment.</td>
        </tr>
        <tr>
            <td><strong>Docker Network vs Host</strong></td>
            <td>Host network removes isolation. Bridge network creates a private subnet with an internal DNS.</td>
            <td>A custom <strong>Bridge Network</strong> was created. No service (except Nginx) is exposed to the host, preventing direct attacks on MariaDB.</td>
        </tr>
        <tr>
            <td><strong>Volumes vs Bind Mounts</strong></td>
            <td>Volumes are Docker-managed. Bind Mounts are direct links to host paths.</td>
            <td>A <strong>Hybrid Approach</strong>: Named volumes with <code>driver_opts (bind)</code> were used to meet the <code>/home/bn-bn/data</code> requirement while keeping volume initialization features.</td>
        </tr>
    </table>

    <h2>🚀 Instructions</h2>
    <ol>
        <li><strong>Host Setup:</strong> Map <code>127.0.0.1 bn-bn.42.fr</code> in your <code>/etc/hosts</code>.</li>
        <li><strong>Build & Launch:</strong> Run <code>make all</code>. This automates directory creation and permissions.</li>
        <li><strong>Verification:</strong> Access <code>https://bn-bn.42.fr</code>. HTTP (Port 80) is strictly blocked.</li>
    </ol>

    <h2>📚 Resources & AI Usage</h2>
    <ul>
        <li>Docker Documentation & Debian 12 Security Handbooks.</li>
        <li><strong>AI Usage (Gemini):</strong> AI was used as a senior mentor to debug the <strong>FTP Passive Mode</strong> flow (handling ephemeral ports through the bridge), clarifying <strong>UnionFS Layering</strong> (Copy-on-Write), and optimizing the <strong>Makefile</strong> to prevent permission race conditions.</li>
    </ul>
</body>
</html>