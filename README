# Mac Home Manager configurations

Home Manager configurations for my personal and work macOS accounts on Apple
Silicon.

## Profiles

- `jmp`: personal account
- `work`: work account

## Fresh Mac setup

Use these steps on a brand new Mac before this managed Home Manager environment
exists.

1. Install manual prerequisites.

   Do not use Homebrew for this setup. Install these with Apple-provided tools
   or official vendor installers only:

   - Determinate Nix: download and run `Determinate.pkg` from
     https://determinate.systems/nix/
   - Xcode Command Line Tools: install with:

     ```sh
     xcode-select --install
     ```

   - Ghostty: download the official macOS `.dmg` from https://ghostty.org/ and
     drag `Ghostty.app` into `/Applications`.
   - SauceCodePro Nerd Font Mono: download `SauceCodePro` from
     https://www.nerdfonts.com/font-downloads and install the font files with
     Font Book. This matches the Ghostty `font-family` setting in this repo.

   After installing Determinate Nix, open a new terminal and confirm that Nix
   is available:

   ```sh
   nix --version
   ```

2. Clone this configuration.

   Clone the repo into the Home Manager config location:

   ```sh
   mkdir -p ~/.config
   git clone git@github.com:jimpudar/nix.git ~/.config/nix
   cd ~/.config/nix
   ```

   If GitHub SSH is not set up yet, clone with HTTPS instead:

   ```sh
   git clone https://github.com/jimpudar/nix.git ~/.config/nix
   cd ~/.config/nix
   ```

3. Bootstrap Home Manager.

   On the first run, use `nix run` because the `home-manager` command has not
   been installed into the user environment yet. Choose the profile for the
   macOS account you are setting up:

   ```sh
   nix run github:nix-community/home-manager/release-26.05 -- switch --flake ~/.config/nix#jmp
   ```

   Or for the work account:

   ```sh
   nix run github:nix-community/home-manager/release-26.05 -- switch --flake ~/.config/nix#work
   ```

   When this finishes, open a new terminal so the newly managed shell
   environment is loaded.

4. Verify the managed environment.

   ```sh
   home-manager generations
   which home-manager
   which nvim
   ```

5. Initialize LazyVim plugins.

   Neovim and the LazyVim starter configuration are installed by this Home
   Manager configuration. On the first launch, LazyVim will bootstrap
   `lazy.nvim` and plugins into Neovim's user data directory:

   ```sh
   nvim
   ```

   After the first launch finishes installing plugins, run `:LazyHealth` inside
   Neovim.

## Ongoing usage

After the first successful switch, use the installed `home-manager` command.

Switch the personal account:

```sh
cd ~/.config/nix
home-manager switch --flake .#jmp
```

Switch the work account:

```sh
cd ~/.config/nix
home-manager switch --flake .#work
```

Update all flake inputs and switch:

```sh
cd ~/.config/nix
nix flake update
home-manager switch --flake .#jmp  # or .#work
```

Preview pending changes before switching:

```sh
cd ~/.config/nix
home-manager build --flake .#jmp  # or .#work
```

## Layout

- `flake.nix` defines the `jmp` and `work` Home Manager outputs.
- `modules/` contains shared configuration used by both accounts.
- `nvim/` contains the shared LazyVim starter configuration.
- `profiles/` contains account-specific packages, Git settings, paths, and zsh
  startup snippets.

## Notes

- This flake is currently pinned to `aarch64-darwin`.
- Nixpkgs, Home Manager, and `home.stateVersion` are currently aligned on
  `26.05`.
- Home Manager configures Ghostty, but it does not install the macOS
  application bundle here because `programs.ghostty.package = null`.
- Home Manager installs Neovim. Do not install Neovim manually on a fresh
  machine for this setup.
- Home Manager writes the LazyVim starter config under `~/.config/nvim`.
  LazyVim plugins are installed by `lazy.nvim` on first Neovim launch.
- If an account already has unmanaged files under `~/.config/nvim`, move them
  aside before switching to this Home Manager configuration.
- The Home Manager profile is user-scoped; do not run `home-manager switch`
  with `sudo`.
- Run each profile from the macOS account it manages.
- If `nix` is unavailable immediately after installing Determinate Nix, open a
  new terminal window or restart the Mac.
