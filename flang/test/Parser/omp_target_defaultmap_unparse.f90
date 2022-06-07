! RUN: %flang_fc1 -fdebug-unparse-no-sema -fopenmp %s | FileCheck --ignore-case %s
! Verifies the unparsing of the Openmp Target Defaultmap constructs
PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER, PARAMETER :: N = 8
  INTEGER :: M = 99
  REAL :: A(N) = 99

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(ALLOC:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(ALLOC:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(ALLOC:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(ALLOC:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET


!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TO:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TO:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TO:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TO:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FROM:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FROM:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FROM:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FROM:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TOFROM:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TOFROM:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TOFROM:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(TOFROM:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:SCALAR)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(DEFAULT:SCALAR)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:AGGREGATE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(DEFAULT:AGGREGATE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:POINTER)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(DEFAULT:POINTER)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:ALLOCATABLE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(DEFAULT:ALLOCATABLE)
  M = M + 1
  A = A + 1
!$OMP END TARGET

!-------------------------------------------------------------------------------
! Check Defaultmap clause with None implicit-behavior
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(NONE)
!CHECK: !$OMP END TARGET
!$OMP TARGET DEFAULTMAP(NONE)
  M = M + 1
  A = A + 1
!$OMP END TARGET
END PROGRAM
