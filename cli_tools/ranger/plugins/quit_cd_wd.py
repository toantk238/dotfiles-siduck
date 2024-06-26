from __future__ import (absolute_import, division, print_function)
import os
from ranger.api.commands import Command

class quitall_cd_wd(Command):
    """:chdir to working directory of ranger after quitalling on ranger.

    """
    def _exit_no_work(self):
        if self.fm.loader.has_work():
            self.fm.notify('Not quitting: Tasks in progress: Use `quitall!` to force quit')
        else:
            self.fm.exit()

    def execute(self):
        self.save_wd()
        self._exit_no_work()

    def save_wd(self):
        with open(os.path.expanduser('~/.cache/ranger/quit_cd_wd'), 'w') as f:
            f.write(self.fm.thisdir.path);
