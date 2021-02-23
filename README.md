Simply run

```console
$ nix-shell
$ gfortran main.f90 -lblas && ./a.out
```

You should see a segfault:

```console
$ gfortran main.f90 -lblas && ./a.out
f951: Warning: command line option ‘-Wformat=1’ is valid for C/C++/ObjC/ObjC++ but not for Fortran
f951: Warning: command line option ‘-Wformat-security’ is valid for C/C++/ObjC/ObjC++ but not for Fortran
f951: Warning: ‘-Werror=’ argument ‘-Werror=format-security’ is not valid for Fortran
a = 5.0
X = [ 5.0 6.0 7.0 ]

Program received signal SIGSEGV: Segmentation fault - invalid memory reference.

Backtrace for this error:
#0  0x7f7ea902eb90 in ???
#1  0x7f7ea902ddc5 in ???
#2  0x7f7ea8cdf39f in ???
#3  0x7f7eaa0db328 in ???
Segmentation fault (core dumped)

```

However, you can check out OpenBLAS in a different directory and build it:

```console
$ cd /tmp
$ git clone git@github.com:xianyi/OpenBLAS.git
$ nix-shell '<nixpkgs>' -A openblas
$ make
```

Now you can run the program we built earlier with the self-built OpenBLAS and it
should mysteriously just work.

```console
$ LD_LIBRARY_PATH=/tmp/OpenBlas:$LD_LIBRARY_PATH ./a.out
a = 5.0
X = [ 5.0 6.0 7.0 ]

X = a * X
X = [ 25.0 30.0 35.0 ]
```
