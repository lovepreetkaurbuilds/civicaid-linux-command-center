# CivicAid Linux Security Checklist

This checklist documents basic Linux/server security habits used in the CivicAid Linux Operations Command Center.

## Secret safety

- Never commit real passwords, API keys, tokens, or private keys.
- Commit only safe example config files such as config/app.env.example.
- Keep local config files such as config/app.env ignored by Git.
- Use fake/sample values in public repositories.

## File permissions

- Use chmod 600 for local private config files.
- Use chmod 644 for safe example config files.
- Use chmod +x only for scripts that need to run.
- Check permissions with ls -l.

## Sudo safety

- Use sudo only when required.
- Do not use sudo to hide permission mistakes.
- Do not run destructive commands without checking pwd and ls first.

## SSH key safety

- Public keys ending in .pub can be shared with GitHub or servers.
- Private keys must never be shared, uploaded, or pasted anywhere.
- Private keys should have restricted permissions.

## Least privilege

- Give users only the access they need.
- Separate admin, volunteer, finance, support, and viewer roles.
- Finance data should not be accessible to every user.

## Updates and patching

- Run sudo apt update before installing packages.
- Run sudo apt upgrade regularly on real servers.
- Keep tools and dependencies updated.

## Firewall concept

- Only expose ports that are needed.
- Local testing can use localhost.
- Real servers should restrict public access carefully.

## Logging and auditing

- Keep logs for scripts and scheduled jobs.
- Check logs for ERROR and WARNING entries.
- Run security audits before pushing public changes.
