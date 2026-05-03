# Stage 15: Environment Variables and PATH

This stage demonstrates environment variables, PATH, .bashrc, source, and secret safety using the CivicAid Linux Operations Command Center.

## Commands practiced

- env
- printenv
- export
- echo $PATH
- command -v
- source
- chmod

## Concepts learned

- Environment variables store configuration outside code.
- PATH tells Linux where to find executable commands.
- .bashrc runs when Bash starts.
- source loads a file into the current shell.
- Real secrets should never be committed to GitHub.

## CivicAid tasks completed

1. Created fake CivicAid environment variables.
2. Updated config/app.env.example with safe sample values.
3. Created local config/app.env and ignored it using .gitignore.
4. Protected local config with chmod 600.
5. Loaded environment variables from config/app.env.
6. Updated Python app to read environment variables.
7. Added tests for configuration defaults.
8. Created scripts/load_env.sh.

## Safety rule

Only config/app.env.example is committed. Real local config files such as config/app.env are ignored and must not be pushed to GitHub.
