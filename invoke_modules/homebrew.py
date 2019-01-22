import invoke

from invoke_modules.constants import (BREW_CASK_PACKAGES_FILE, BREW_PACKAGES_FILE)


@invoke.task
def install_homebrew(ctx):
    """Installs homebrew."""
    if 'DARWIN' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on OS X, so not installing homebrew')
        return

    print("Installing homebrew...")
    ctx.run(
        '/usr/bin/ruby -e "$(curl -fsSL '
        'https://raw.githubusercontent.com/Homebrew/install/master/install)"',
        echo=True)


@invoke.task
def brew_packages(ctx):
    """Installs homebrew packages."""
    if 'DARWIN' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on OS X, so not installing brew packages!')
        return

    print("Installing homebrew packages...")
    with open(BREW_PACKAGES_FILE, 'r') as f:
        packages = [p.strip() for p in f.readlines()]
    packages_str = ' '.join(packages)
    ctx.run(f'brew install {packages_str}', echo=True, warn=True)

    print("Installing homebrew cask packages...")
    with open(BREW_CASK_PACKAGES_FILE, 'r') as f:
        cask_packages = [p.strip() for p in f.readlines()]
    cask_packages_str = ' '.join(cask_packages)
    ctx.run(f'brew cask install {cask_packages_str}', echo=True, warn=True)


@invoke.task
def update_brew(ctx):
    """Updates all brew packages."""
    print("Updating brew and brew packages...")
    ctx.run('brew update', echo=True, warn=True)
    ctx.run('brew upgrade', echo=True, warn=True)
    ctx.run(f'brew list > {BREW_PACKAGES_FILE}', echo=True)
    ctx.run(f'brew cask list > {BREW_CASK_PACKAGES_FILE}', echo=True)
