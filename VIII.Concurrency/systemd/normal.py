#!/usr/bin/env python

import signal
import time
import traceback


def handler(*args):
    print 'SIGTERM Handler'
    exit(0)


def main():
    signal.signal(signal.SIGTERM, handler)

    while True:
        time.sleep(1)
        print 'systemd Test'


if __name__ == '__main__':
    main()
