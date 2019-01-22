import invoke


@invoke.task
def tmux_packages(ctx):
    """Installs tpm and tmux plugins."""
    print("Installing tpm and tmux plugins...")
    ctx.run(
        'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm', echo=True, warn=True)
    ctx.run('~/.tmux/plugins/tpm/bin/install_plugins', echo=True, warn=True)


@invoke.task
def update_tmux(ctx):
    """Updates all tmux packages."""
    print("Updating tmux packages...")
    ctx.run('~/.tmux/plugins/tpm/bin/clean_plugins', echo=True, warn=True)
    ctx.run('~/.tmux/plugins/tpm/bin/update_plugins all', echo=True)
