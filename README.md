# Dotfiles

moved to codeberg

### Updating the dotfiles
```bash
stow .
```

### Updating pacman
Update everything
```bash
sudo pacman -Syu
```

Dump pacman to the "lock" files
```bash
pacman -Qqe > ~/dotfiles/pacman/pacman.txt
pacman -Qqm > ~/dotfiles/pacman/aur.txt
```

