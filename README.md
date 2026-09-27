# Dotfiles

Personal configuration for Omarchy, installed with [mise Bootstrap](https://mise.jdx.dev/bootstrap.html).

## Fresh Omarchy installation

### 1. Install prerequisites

Use Omarchy's Install menu to install the software that should remain managed by Omarchy.

- Install Voxtype if it should be available on this machine.

Mise installs [`ai-usagebar-bin`](https://github.com/akitaonrails/ai-usagebar),
[`gitmux-bin`](https://github.com/arl/gitmux),
[`mongodb-compass-bin`](https://www.mongodb.com/products/tools/compass),
[`sinuous`](https://github.com/abusch/sinuous), and
[`tabularis-bin`](https://github.com/TabularisDB/tabularis) from the AUR as part of
Bootstrap. It also installs `rclone`, `syncthing`, `git-delta`, `keepassxc`, `hyphen-de`,
`shellcheck`, `meld`, `yazi`, `7zip`, and `playerctl` from the Arch repositories.

Node.js, Java, and Go are installed through Omarchy when they are not already present. Go's
module cache is configured at `~/.cache/go`. VS Code is also installed through Omarchy when
needed.

### 2. Bootstrap

Run this from a terminal:

```bash
mkdir -p "$HOME/Projects"

mise bootstrap \
  --from https://github.com/sgruendel/dotfiles.git \
  --from-dir "$HOME/Projects/dotfiles" \
  --force-dotfiles \
  --yes
```

This command:

- clones this repository into `~/Projects/dotfiles`;
- installs the declared Arch and AUR packages;
- clones the Tmux and Omarchy plugin repositories;
- backs up existing configuration files;
- installs VS Code through Omarchy when needed;
- installs Node.js, Java, and Go through Omarchy when needed;
- configures Go's module cache under `~/.cache`;
- replaces the managed files with symlinks into this repository; and
- starts browser-based GitHub authentication when needed.

`--force-dotfiles` is required on the first run because a fresh Omarchy installation already contains regular files at
several managed paths. Those files are backed up before mise replaces them.

### 3. Verify and reload

After Bootstrap completes:

```bash
cd "$HOME/Projects/dotfiles"
mise trust
mise bootstrap status --missing

hyprctl reload
hyprctl configerrors
omarchy restart shell
```

Open a new terminal afterward so Readline and other shell-related settings are reloaded.

## Preview before applying

`mise bootstrap --from --dry-run` does not clone a missing checkout. To inspect the complete plan before changing
anything, clone the repository first:

```bash
mkdir -p "$HOME/Projects"
git clone https://github.com/sgruendel/dotfiles.git "$HOME/Projects/dotfiles"
cd "$HOME/Projects/dotfiles"

mise trust
mise bootstrap --dry-run --force-dotfiles
mise bootstrap --force-dotfiles --yes
```

## Backups

The `pre-dotfiles` hook copies existing files that are about to be replaced into a timestamped directory under:

```text
~/.local/state/dotfiles/bootstrap-backups/
```

It preserves the original paths and metadata. Symlinks that already point into this checkout are skipped, so normal
repeated Bootstrap runs do not create redundant backups.

## Updating

To update the dotfiles, plugin repositories, and declared packages:

```bash
cd "$HOME/Projects/dotfiles"
git pull --ff-only
mise bootstrap --update --yes
mise bootstrap status --missing
```

The Bootstrap task is safe to run repeatedly. Use `--force-dotfiles` again only when intentionally replacing a new
conflicting regular file; the backup hook will preserve that file first.

If newly installed shell plugins do not appear, force plugin discovery with:

```bash
omarchy-shell shell rescanPlugins
```
