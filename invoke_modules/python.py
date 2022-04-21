import invoke

from invoke_modules.constants import (PYTHON2_PACKAGES_FILE,
                                      PYTHON3_PACKAGES_FILE)


@invoke.task
def update_pip(ctx):
    """Updates all pip packages for python3 and python2."""

    print("Updating pip3 packages...")
    PY3_PIP = 'python3 -m pip'
    ctx.run(rf'{PY3_PIP} freeze --local | grep -v "^\-e" | cut -d = -f 1  | '
            f'xargs -n1 {PY3_PIP} install -U',
            echo=True)
    ctx.run(f'{PY3_PIP} freeze > {PYTHON3_PACKAGES_FILE}', echo=True)

    print("Updating pip2 packages...")
    PY2_PIP = 'python2 -m pip'
    ctx.run(rf'{PY2_PIP} freeze --local | grep -v "^\-e" | cut -d = -f 1  | '
            f'xargs -n1 {PY2_PIP} install -U',
            echo=True,
            warn=True)
    ctx.run(f'{PY2_PIP} freeze > {PYTHON2_PACKAGES_FILE}', echo=True, warn=True)


@invoke.task
def pip_packages(ctx):
    """Installs python2 and python3 packages."""
    print("Installing pip2 and pip3 packages...")
    ctx.run(f'python2 -m pip install -r {PYTHON2_PACKAGES_FILE}', echo=True, warn=True)
    ctx.run(f'python3 -m pip install -r {PYTHON3_PACKAGES_FILE}', echo=True, warn=True)
