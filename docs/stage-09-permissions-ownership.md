# Stage 9: Linux Permissions and Ownership

This stage demonstrates practical Linux permissions and ownership concepts using the CivicAid project.

## Commands practiced

- ls -l
- chmod
- chown concept
- sudo concept
- whoami

## Concepts learned

- read permission
- write permission
- execute permission
- user permissions
- group permissions
- others permissions
- numeric permissions such as 755, 644, 600

## CivicAid tasks completed

1. Checked file and folder permissions using ls -l.
2. Made shell scripts executable using chmod +x.
3. Protected the sample config file using chmod 644.
4. Tested and fixed a permission denied scenario safely.
5. Learned when sudo is needed and why it should not be used carelessly.

## Permission examples

```bash
chmod +x scripts/*.sh
chmod 644 config/app.env.example
chmod 600 config/app.env                                                    EOF
