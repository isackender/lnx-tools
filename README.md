# Neo Bootstrap

Mini bootstrap to quickly configure a Linux server with my basic tools.

Automatically installs:

- Custom aliases
- Useful scripts (backup nginx, restore nginx)
- Basic tools (`git`, `nano`, `htop`)

---

# Installation

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/isackender/lnx-tools/main/install.sh | bash
```

The installer:

1. installs `git` if does not exist
2. clones repository in:

```
/opt/lnx-tools
```

3. runs main bootstrap

---

# What gets installed

## Basic tools

```
git
nano
htop
```

---

## Aliases

They are added in:

```
~/.bash_aliases
```

Installed aliases:

```bash
alias edalias='nano ~/.bash_aliases && sourcealias'
alias sourcealias="source ~/.bash_aliases && printf '\n--\nAliases updated, Neo.\n'"
alias updateos="apt update && apt upgrade -y && printf '\n--\nSystem updated, Neo.\n'"
```

---

## Scripts

They are copied in:

```
/usr/local/bin
```

Available scripts:

```
backup-nginx
restore-nginx
```

Examples:

```bash
backup-nginx
restore-nginx list
restore-nginx latest
```

---

# Update bootstrap

You can run the installer anytime:

```bash
curl -fsSL https://raw.githubusercontent.com/isackender/lnx-tools/main/install.sh | bash
```

The script:

- updates repository
- reapplies configuration
- does not duplicate aliases

---

# Repository structure

```
lnx-tools/
├─ install.sh
├─ bootstrap.sh
├─ install-aliases.sh
├─ install-scripts.sh
├─ files/
│  └─ bash_aliases
└─ scripts/
   ├─ backup-nginx
   └─ restore-nginx
```

---

# Requirements

System based on:

```
Debian
Ubuntu
```

With package manager:

```
apt
```

---

# Notes

To avoid formatting issues in scripts, the repository includes:

```
.gitattributes
```

with:

```
*.sh text eol=lf
```
