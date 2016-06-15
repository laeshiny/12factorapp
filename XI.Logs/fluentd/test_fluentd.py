import logging
import logging.handlers

LOG_FILENAME = 'test.log'

logger = logging.getLogger('Fluentd-Test')
logger.setLevel(logging.DEBUG)

log_formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
handler = logging.handlers.RotatingFileHandler(LOG_FILENAME, maxBytes=200000, backupCount=5)
handler.setLevel(logging.DEBUG)
handler.setFormatter(log_formatter)

logger.addHandler(handler)


def main():
    logger.info('Info Test')
    logger.error('Error Test')
    logger.debug('Debug Test')


if __name__ == '__main__':
    main()
