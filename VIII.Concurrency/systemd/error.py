#!/usr/bin/env python

import signal
import time
import traceback


def handler(*args):
    print 'SIGTERM Handler'
    print traceback.format_exc()
    exit(0)


def main():
    signal.signal(signal.SIGTERM, handler)

    while True:
        time.sleep(1)
        print 'systemd Test'

        a = 1 / 0

        print 'a is', a


if __name__ == '__main__':
    main()
