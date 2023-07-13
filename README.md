# poetry2nix-venv

Testing [poetry2nix](https://github.com/nix-community/poetry2nix) as an alternative to docker-based development environments.

## Goals

1. [x] Activate a sub-shell when the user cd into the folder
2. [x] Install all the dependencies in a nix venv
3. [x] Import all the dependencies in a interactive python shell
4. [x] Run the exposed `./my-python-nix-test` script
5. [ ] Run the script using `python ./my_python_nix_test/a.py`
6. [ ] Run the script using `poetry run my-python-nix-test`

### 1. Activate a sub-shell when the user cd into the folder

[direnv](my-python-nix-test) is not required, but can be used to automatically activate the sub-shell (as declared on the `.envrc` file).

Alternativetly you can manually activate the sub-shell by typing:

```bash
$ nix-shell
[nix-shell:~/d/bigluck/bigluck-poetry2nix-env]$ 
```

### 2. Install all the dependencies in a nix venv

The nix sub-shell should install python3.11, and `poetry2nix` should also install requirements in the venv.

```bash
$ which python
/nix/store/136xg64ddmk4gnwwichp86vchg295kvc-python3-3.11.4-env/bin/python

$ ls -la ./venv
lrwxr-xr-x 1 bigluck staff 62 Jul 13 11:16 ./venv -> /nix/store/136xg64ddmk4gnwwichp86vchg295kvc-python3-3.11.4-env

$ ls -la ./venv/lib/python3.11/site-packages/
dr-xr-xr-x  18 root wheel  576 Jan  1  1970 .
dr-xr-xr-x 209 root wheel 6688 Jan  1  1970 ..
lrwxr-xr-x   1 root wheel   98 Jan  1  1970 README.txt -> /nix/store/zdd58zb8y7bm15jm0985fdjzy8wrmaci-python3-3.11.4/lib/python3.11/site-packages/README.txt
lrwxr-xr-x   1 root wheel   99 Jan  1  1970 __pycache__ -> /nix/store/zdd58zb8y7bm15jm0985fdjzy8wrmaci-python3-3.11.4/lib/python3.11/site-packages/__pycache__
lrwxr-xr-x   1 root wheel  120 Jan  1  1970 _sysconfigdata__darwin_darwin.py -> /nix/store/zdd58zb8y7bm15jm0985fdjzy8wrmaci-python3-3.11.4/lib/python3.11/site-packages/_sysconfigdata__darwin_darwin.py
lrwxr-xr-x   1 root wheel  108 Jan  1  1970 certifi -> /nix/store/zpgnksy3w6iym5wyvv1bda9f04pps3m7-python3.11-certifi-2023.5.7/lib/python3.11/site-packages/certifi
lrwxr-xr-x   1 root wheel  127 Jan  1  1970 certifi-2023.5.7.dist-info -> /nix/store/zpgnksy3w6iym5wyvv1bda9f04pps3m7-python3.11-certifi-2023.5.7/lib/python3.11/site-packages/certifi-2023.5.7.dist-info
lrwxr-xr-x   1 root wheel  127 Jan  1  1970 charset_normalizer -> /nix/store/zc2hh3fh43a2c294gb8h9hvswya3ml7p-python3.11-charset-normalizer-3.2.0/lib/python3.11/site-packages/charset_normalizer
lrwxr-xr-x   1 root wheel  143 Jan  1  1970 charset_normalizer-3.2.0.dist-info -> /nix/store/zc2hh3fh43a2c294gb8h9hvswya3ml7p-python3.11-charset-normalizer-3.2.0/lib/python3.11/site-packages/charset_normalizer-3.2.0.dist-info
lrwxr-xr-x   1 root wheel   97 Jan  1  1970 idna -> /nix/store/xgm02j27yb5z7sn3df3525hkkcc7z5yk-python3.11-idna-3.4/lib/python3.11/site-packages/idna
lrwxr-xr-x   1 root wheel  111 Jan  1  1970 idna-3.4.dist-info -> /nix/store/xgm02j27yb5z7sn3df3525hkkcc7z5yk-python3.11-idna-3.4/lib/python3.11/site-packages/idna-3.4.dist-info
lrwxr-xr-x   1 root wheel  128 Jan  1  1970 my-python-nix-test.egg-info -> /nix/store/rsx629p4s3pcp6xvmqv9j1qqg8917zk3-my-python-nix-test-editable/lib/python3.11/site-packages/my-python-nix-test.egg-info
lrwxr-xr-x   1 root wheel  124 Jan  1  1970 poetry2nix-editable.pth -> /nix/store/rsx629p4s3pcp6xvmqv9j1qqg8917zk3-my-python-nix-test-editable/lib/python3.11/site-packages/poetry2nix-editable.pth
lrwxr-xr-x   1 root wheel  108 Jan  1  1970 requests -> /nix/store/8l792z9zkc7k4agdvygf0zck85w9n9m9-python3.11-requests-2.31.0/lib/python3.11/site-packages/requests
lrwxr-xr-x   1 root wheel  125 Jan  1  1970 requests-2.31.0.dist-info -> /nix/store/8l792z9zkc7k4agdvygf0zck85w9n9m9-python3.11-requests-2.31.0/lib/python3.11/site-packages/requests-2.31.0.dist-info
lrwxr-xr-x   1 root wheel  104 Jan  1  1970 sitecustomize.py -> /nix/store/zdd58zb8y7bm15jm0985fdjzy8wrmaci-python3-3.11.4/lib/python3.11/site-packages/sitecustomize.py
lrwxr-xr-x   1 root wheel  105 Jan  1  1970 urllib3 -> /nix/store/dm0p5li5x3g3kq5azx8f3fmwrislmn8l-python3.11-urllib3-2.0.3/lib/python3.11/site-packages/urllib3
lrwxr-xr-x   1 root wheel  121 Jan  1  1970 urllib3-2.0.3.dist-info -> /nix/store/dm0p5li5x3g3kq5azx8f3fmwrislmn8l-python3.11-urllib3-2.0.3/lib/python3.11/site-packages/urllib3-2.0.3.dist-info

$ ls -la ./venv/bin
dr-xr-xr-x 20 root wheel   640 Jan  1  1970 .
dr-xr-xr-x  6 root wheel   192 Jan  1  1970 ..
lrwxr-xr-x  1 root wheel   109 Jan  1  1970 .my-python-nix-test-wrapped -> /nix/store/h60yll9pmmdkvqbhh5s1qfhfffabagy9-python3.11-poetry2nix-env-scripts/bin/.my-python-nix-test-wrapped
lrwxr-xr-x  1 root wheel   103 Jan  1  1970 .normalizer-wrapped -> /nix/store/zc2hh3fh43a2c294gb8h9hvswya3ml7p-python3.11-charset-normalizer-3.2.0/bin/.normalizer-wrapped
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 2to3
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 2to3-3.11
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 idle
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 idle3
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 idle3.11
-r-xr-xr-x  1 root wheel 51200 Jan  1  1970 my-python-nix-test
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 normalizer
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 pydoc
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 pydoc3
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 pydoc3.11
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 python
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 python-config
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 python3
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 python3-config
-r-xr-xr-x  1 root wheel 51184 Jan  1  1970 python3.11
-r-xr-xr-x  1 root wheel 51200 Jan  1  1970 python3.11-config
```

### 3. Import all the dependencies in a interactive python shell

Let's see if my `requests` and `my_python_nix_test` deps can be imported on a interactive python shell:

```bash
$ which python
/nix/store/136xg64ddmk4gnwwichp86vchg295kvc-python3-3.11.4-env/bin/python
$ python
Python 3.11.4 (main, Jun 23 2023, 11:49:25) [Clang 11.1.0 ] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import requests
>>> requests.__version__
'2.31.0'
>>>
>>> import my_python_nix_test
>>> my_python_nix_test.requests_version
'2.31.0'
>>>
>>> import my_python_nix_test.a
>>> my_python_nix_test.a.main()
Requests.version == 2.31.0
requests_version == 2.31.0
```

### 4. Run the exposed `./my-python-nix-test` script

The `bin` folder contains my `my-python-nix-test` script. Let's check if it works:

```bash
$ which my-python-nix-test
/nix/store/136xg64ddmk4gnwwichp86vchg295kvc-python3-3.11.4-env/bin/my-python-nix-test

$ my-python-nix-test
Requests.version == 2.31.0
requests_version == 2.31.0

$ ./venv/bin/my-python-nix-test
Requests.version == 2.31.0
requests_version == 2.31.0
```

### 5. Run the script using `python ./my_python_nix_test/a.py`

Now I want to manually run the `my_python_nix_test/a.py` python script from my active sub-shell

```bash
$ which python
/nix/store/136xg64ddmk4gnwwichp86vchg295kvc-python3-3.11.4-env/bin/python

# It fails
$ python my_python_nix_test/a.py 
Traceback (most recent call last):
  File "/Users/bigluck/d/bigluck/bigluck-poetry2nix-env/my_python_nix_test/a.py", line 3, in <module>
    from my_python_nix_test.helpers import requests_version
ModuleNotFoundError: No module named 'my_python_nix_test'

# ...but still it works using the interactive shell
$ python
>>> import my_python_nix_test.a
>>> my_python_nix_test.a.main()
Requests.version == 2.31.0
requests_version == 2.31.0
```

### 6. Run the script using `poetry run my-python-nix-test`

In this demo `poetry`` has been installed globaly on my system using `nix-env --install poetry`.
Ideally I would prefere to declare it as a `buildInputs`, but it's not urgent.

```bash
$ which poetry
/Users/bigluck/.nix-profile/bin/poetry

$ cat $(which poetry)
...
export PATH
export PYTHONNOUSERSITE='true'
unset PYTHONPATH
exec -a "$0" "/nix/store/k2m6r8q2x3z3id3j573hxbc57zssh3n5-python3.10-poetry-1.5.1/bin/.poetry-wrapped"  "$@" 
```

Let's now test if I can invoke my script using `poetry`:

```bash
$ poetry run my-python-nix-test
Warning: 'my-python-nix-test' is an entry point defined in pyproject.toml, but it's not installed as a script. You may get improper `sys.argv[0]`.

The support to run uninstalled scripts will be removed in a future release.

Run `poetry install` to resolve and get rid of this message.

Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/nix/store/zdd58zb8y7bm15jm0985fdjzy8wrmaci-python3-3.11.4/lib/python3.11/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1126, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 1204, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1176, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1147, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 690, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 940, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "/Users/bigluck/d/bigluck/bigluck-poetry2nix-env/my_python_nix_test/__init__.py", line 1, in <module>
    from my_python_nix_test.helpers import requests_version
  File "/Users/bigluck/d/bigluck/bigluck-poetry2nix-env/my_python_nix_test/helpers.py", line 1, in <module>
    import requests
ModuleNotFoundError: No module named 'requests'
```
