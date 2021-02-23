program main
    implicit none (type, external)
    external :: sscal

    integer, parameter :: N = 3

    real :: x(N) = [ 5., 6., 7. ]
    real :: a    = 5.

    print '(a, f0.1)',            'a = ', a
    print '(a, 3(f0.1, " "), a)', 'X = [ ', x, ']'

    call sscal(N, a, x, 1)

    print '(/, a)',               'X = a * X'
    print '(a, 3(f0.1, " "), a)', 'X = [ ', x, ']'
end program main
