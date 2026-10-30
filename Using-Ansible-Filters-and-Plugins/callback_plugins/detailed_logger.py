#!/usr/bin/env python3

from ansible.plugins.callback import CallbackBase
from datetime import datetime


class CallbackModule(CallbackBase):
    """
    Custom callback plugin for detailed logging
    """

    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = 'stdout'
    CALLBACK_NAME = 'detailed_logger'

    def __init__(self):
        super(CallbackModule, self).__init__()
        self.start_time = None
        self.task_start_time = None

    def v2_playbook_on_start(self, playbook):
        self.start_time = datetime.now()
        self._display.display(f"\n=== PLAYBOOK START: {playbook._file_name} ===")
        self._display.display(f"Start time: {self.start_time.strftime('%Y-%m-%d %H:%M:%S')}")

    def v2_playbook_on_play_start(self, play):
        self._display.display(f"\n--- PLAY: {play.get_name()} ---")

    def v2_playbook_on_task_start(self, task, is_conditional):
        self.task_start_time = datetime.now()
        self._display.display(f"\nTASK: {task.get_name()}")

    def v2_runner_on_ok(self, result):
        if self.task_start_time:
            duration = datetime.now() - self.task_start_time
            self._display.display(f"SUCCESS on {result._host.get_name()} (Duration: {duration.total_seconds():.2f}s)")

        if result._result.get('msg'):
            self._display.display(f"  Message: {result._result['msg']}")

    def v2_runner_on_failed(self, result, ignore_errors=False):
        if self.task_start_time:
            duration = datetime.now() - self.task_start_time
            self._display.display(f"FAILED on {result._host.get_name()} (Duration: {duration.total_seconds():.2f}s)")

        self._display.display(f"  Error: {result._result.get('msg', 'Unknown error')}")

    def v2_playbook_on_stats(self, stats):
        if self.start_time:
            total_duration = datetime.now() - self.start_time
            self._display.display("\n=== PLAYBOOK COMPLETE ===")
            self._display.display(f"Total duration: {total_duration.total_seconds():.2f} seconds")

            hosts = sorted(stats.processed.keys())
            for host in hosts:
                summary = stats.summarize(host)
                self._display.display(
                    f"Host {host}: ok={summary['ok']} changed={summary['changed']} "
                    f"unreachable={summary['unreachable']} failed={summary['failures']}"
                )
