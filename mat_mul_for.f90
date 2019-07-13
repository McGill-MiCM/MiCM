! program main
! 	implicit none
! 	double precision :: A (2, 4)
! 	double precision :: B (4, 3)
! 	double precision :: AB (2, 3)
! 	integer :: i, j, k, ra, ca, rb, cb, rab, cab
!
! 	ra = 2
! 	ca = 4
! 	rb = 4
! 	cb = 3
! 	rab = 2
! 	cab = 3
! 	k = 1
!
! 	do i = 1, ra
! 		do j = 1, ca
! 			A(i, j) = k
! 			k = k + 1
! 		end do
! 	end do
!
! 	do i = 1, rb
! 		do j = 1, cb
! 			B(i, j) = (i - 1) * 3 + j
! 		end do
! 	end do
!
! 	call mat_mul_for(A, B, AB, ra, ca, rb, cb, rab, cab)
!
! 	print *, "A has", ra, "rows and", ca, "columns"
! 	print *, "A=", A
! 	print *, "B has", rb, "rows and", cb, "columns"
! 	print *, "B=", B
! 	print *, "A*B has", rab, "rows and", cab, "columns"
! 	print *, "A*B=", AB
!
! end program


subroutine mat_mul_for(X, Y, XY, rx, cx, ry, cy, rxy, cxy)
	integer rx, cx, ry, cy, rxy, cxy
	double precision, dimension (rx, cx) :: X
	double precision, dimension (ry, cy) :: Y
	double precision, dimension (rxy, cxy) :: XY
	logical :: conformable
	
	conformable = (cx == ry)
	if (conformable) then
		XY = matmul(X, Y)
	else
		stop 'Error: non-conformable arguments'
	end if
	
end subroutine