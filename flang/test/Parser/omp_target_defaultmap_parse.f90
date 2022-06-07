! RUN: %flang_fc1 -fdebug-unparse-no-sema -fopenmp %s | FileCheck --ignore-case %s
! RUN: %flang_fc1 -fdebug-dump-parse-tree -fopenmp %s | FileCheck --check-prefix="PARSE-TREE" %s
! Checks the parsing of Openmp 5.0 Target Defaultmap constructs
!
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
!$OMP TARGET DEFAULTMAP(ALLOC:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Alloc
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:AGGREGATE)
!$OMP TARGET DEFAULTMAP(ALLOC:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Alloc
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:POINTER)
!$OMP TARGET DEFAULTMAP(ALLOC:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Alloc
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Alloc implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(ALLOC:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(ALLOC:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Alloc
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target



!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:SCALAR)
!$OMP TARGET DEFAULTMAP(TO:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = To
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:AGGREGATE)
!$OMP TARGET DEFAULTMAP(TO:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = To
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:POINTER)
!$OMP TARGET DEFAULTMAP(TO:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = To
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with To implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TO:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(TO:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = To
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:SCALAR)
!$OMP TARGET DEFAULTMAP(FROM:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = From
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:AGGREGATE)
!$OMP TARGET DEFAULTMAP(FROM:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = From
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:POINTER)
!$OMP TARGET DEFAULTMAP(FROM:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = From
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with From implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FROM:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(FROM:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = From
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:SCALAR)
!$OMP TARGET DEFAULTMAP(TOFROM:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Tofrom
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:AGGREGATE)
!$OMP TARGET DEFAULTMAP(TOFROM:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Tofrom
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:POINTER)
!$OMP TARGET DEFAULTMAP(TOFROM:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Tofrom
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Tofrom implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(TOFROM:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(TOFROM:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Tofrom
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:SCALAR)
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Firstprivate
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:AGGREGATE)
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Firstprivate
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:POINTER)
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Firstprivate
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Firstprivate implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(FIRSTPRIVATE:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Firstprivate
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Scalar variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:SCALAR)
!$OMP TARGET DEFAULTMAP(DEFAULT:SCALAR)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Default
!PARSE-TREE: VariableCategory = Scalar
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Aggregate variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:AGGREGATE)
!$OMP TARGET DEFAULTMAP(DEFAULT:AGGREGATE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Default
!PARSE-TREE: VariableCategory = Aggregate
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Pointer variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:POINTER)
!$OMP TARGET DEFAULTMAP(DEFAULT:POINTER)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Default
!PARSE-TREE: VariableCategory = Pointer
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with Default implicit-behavior and Allocatable variable-category
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(DEFAULT:ALLOCATABLE)
!$OMP TARGET DEFAULTMAP(DEFAULT:ALLOCATABLE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = Default
!PARSE-TREE: VariableCategory = Allocatable
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target


!-------------------------------------------------------------------------------
! Check Defaultmap clause with None implicit-behavior
!-------------------------------------------------------------------------------
!CHECK: !$OMP TARGET DEFAULTMAP(NONE)
!$OMP TARGET DEFAULTMAP(NONE)
  M = M + 1
  A = A + 1
!CHECK: !$OMP END TARGET
!$OMP END TARGET

!PARSE-TREE: OmpBeginBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target
!PARSE-TREE: OmpClauseList -> OmpClause -> Defaultmap -> OmpDefaultmapClause
!PARSE-TREE: ImplicitBehavior = None
!PARSE-TREE: OmpEndBlockDirective
!PARSE-TREE: OmpBlockDirective -> llvm::omp::Directive = target

END PROGRAM
