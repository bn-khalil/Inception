<!DOCTYPE html>
<html lang="en">
<body>
    <h1>👤 USER DOCUMENTATION</h1>
    
    <h2>🌐 Provided Services</h2>
    <p>The stack provides a full LEMP environment:</p>
    <ul>
        <li><strong>WordPress:</strong> High-performance CMS running on PHP-FPM.</li>
        <li><strong>Nginx:</strong> Secure entry point via Port 443 (TLS 1.3).</li>
        <li><strong>MariaDB:</strong> Optimized SQL database.</li>
        <li><strong>Bonuses:</strong> Redis (Cache), Adminer (DB UI), and vsftpd (FTP Access).</li>
    </ul>

    <h2>🚦 Operational Commands</h2>
    <p>All operations are handled via the root Makefile:</p>
    <ul>
        <li><code>make</code>: Start the entire infrastructure.</li>
        <li><code>make stop</code>: Gracefully stop all services.</li>
        <li><code>make fclean</code>: Complete reset (Deletes containers, images, and <strong>all physical data</strong>).</li>
    </ul>

    <h2>🔑 Credentials & Access</h2>
    <ul>
        <li><strong>Website:</strong> <a href="https://bn-bn.42.fr">https://bn-bn.42.fr</a></li>
        <li><strong>WordPress Admin:</strong> Access via <code>/wp-admin</code>. Admin user is unique (non-default name).</li>
        <li><strong>Database Management:</strong> Use <strong>Adminer</strong> via the specified port/route.</li>
        <li><strong>Credential Storage:</strong> All passwords are located in <code>srcs/secrets/</code> and injected at runtime.</li>
    </ul>

    <h2>✅ Health Verification</h2>
    <p>Run <code>docker ps</code>. All services must show <strong>(healthy)</strong> or <strong>Up</strong>. Ensure that <code>https://bn-bn.42.fr</code> displays the configured site, not the installation page.</p>
</body>
</html>