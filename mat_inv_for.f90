program test
	implicit none
	
	! Setup
	double precision, dimension (5, 5) :: K
	integer :: n, i, j
	
	! Task
	n = 5
	do i = 1, n
		do j = i, n
			if (i == j) then
				K(i, j) = 1
			else
				K(i, j) = 0
				K(j, i) = 0
			end if
		end do
	end do
	
	print *, K
end program