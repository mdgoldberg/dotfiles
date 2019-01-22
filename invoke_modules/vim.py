import invoke


@invoke.task
def vim_plugins(ctx):
    """Installs vim-plug and all vim plugins specified in config/init.vim."""
    print("Installing/updating/cleaning vim plugins...")
    ctx.run('vim +PlugClean +PlugInstall +PlugUpdate +qall', echo=True)
    ctx.run('nvim +PlugClean +PlugInstall +PlugUpdate +qall', echo=True)
