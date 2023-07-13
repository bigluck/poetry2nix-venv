import requests

from my_python_nix_test.helpers import requests_version

def main():
    print(f'Requests.version == {requests.__version__}')
    print(f'requests_version == {requests_version}')

if __name__ == '__main__':
    main()
