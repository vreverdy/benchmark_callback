! GPLv2 license - V. Reverdy - November 2015 
! Executes n times a loop calling a callback on each element of an array
! gfortran -std=f2008 -Wall -Wextra -O3 callback.f90 -o callback_f90
! ./callback_f90 8192 1048576

! Command line function
integer(kind = 4) function argv(i)
  implicit none
  integer(kind = 4), intent(in) :: i
  character(len = 32) :: arg
  call get_command_argument(i, arg)
  arg = trim(arg)
  read(arg, '(i10)') argv
end function argv

! Callback function
integer(kind = 4) function f(n, m)
  implicit none
  integer(kind = 4), intent(in) :: n, m
  f = n + m
end function f

! Benchmark function
integer(kind = 4) function benchmark(nloops, nelements, callback)
  
  ! Declares variables
  implicit none
  integer(kind = 4), intent(in) :: nloops, nelements
  integer(kind = 4) :: callback
  integer(kind = 4), dimension(nelements) :: array
  integer(kind = 4) :: iloop, ielement
  
  ! Fills the array with numbers
  do ielement = 1, nelements
    array(ielement) = ielement-1
  end do
  
  ! Calls the callbacks on each element of the array and loops over it
  do iloop = 1, nloops
    do ielement = 2, nelements
      array(ielement) = callback(array(ielement-1), array(ielement))
    end do
  end do
  
  ! Computes the sum of elements and returns it
  benchmark = sum(array)
  
end function benchmark

! Main function
program main
  implicit none
  integer(kind = 4), external :: argv, f, benchmark
  integer(kind = 4) :: code
  code = benchmark(argv(1), argv(2), f)
end program main
