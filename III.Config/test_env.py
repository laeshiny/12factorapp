import os


def main():
    debug = os.environ['DEBUG']
    if debug == "1":
        print 'This is debug mode'
    else:
        print 'This is not debug mode'


if __name__ == '__main__':
    main()
