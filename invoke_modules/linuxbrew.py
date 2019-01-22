import invoke

from invoke_modules.constants import LINUXBREW_PACKAGES_FILE


@invoke.task
def install_linuxbrew(ctx):
    """Installs linuxbrew."""
    if 'LINUX' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on Linux, so not installing linuxbrew')
        return

    print("Installing linuxbrew...")
    ctx.run(
        '/usr/bin/ruby -e "$(curl -fsSL '
        'https://raw.githubusercontent.com/Linuxbrew/install/master/install)"',
        echo=True)


@invoke.task
def linuxbrew_packages(ctx):
    """Installs linuxbrew packages."""
    if 'LINUX' not in ctx.run('uname', hide=True).stdout.upper():
        print('Not on Linux, so not installing linuxbrew packages!')
        return

    print("Installing linuxbrew packages...")
    with open(LINUXBREW_PACKAGES_FILE, 'r') as f:
        packages = [p.strip() for p in f.readlines()]
    packages_str = ' '.join(packages)
    ctx.run(f'linuxbrew install {packages_str}', echo=True, warn=True)


@invoke.task
def update_linuxbrew(ctx):
    """Updates linuxbrew packages."""
    # TODO
    raise NotImplementedError
