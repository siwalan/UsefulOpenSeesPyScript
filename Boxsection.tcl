proc Boxsection { secID matID b h t nfdw nftw nfbf nftf {Orient ZZ}} {

    # TcL Function to Create A Box Section Fiber
    # Written by @siwalan
    # Modified by Wsection.tcl from Remo M. de Souza
    # Last Modified : 22 June 2022
    # input parameters
    # secID - section ID number
    # matID - material ID number 
    # b  = width of the box section - outer to outer
    # h  = depth of the box section - outer to outer
    # t  = thickness of box section

    # nfdw = number of fibers along web depth 
    # nftw = number of fibers along web thickness
    # nfbf = number of fibers along flange width
    # nftf = number of fibers along flange thickness

    # Verification
    # https://colab.research.google.com/drive/1ON3gC6S8utZsz3_9NCWQMD3ES37c1KVI?usp=sharing
    
    if {$Orient == "Weak" || $Orient == "YY" } {
        set bb [expr $b - 2 * $t]

        set y1 [expr  $b/2.0]
        set y2 [expr  $bb/2.0]
        set y3 [expr -$bb/2.0]
        set y4 [expr -$b/2.0]
	
        set hh [expr $h - 2 * $t]
        set z1 [expr -$h/2.0]
        set z2 [expr -$hh/2.0]
        set z3 [expr  $hh/2.0]
        set z4 [expr  $h/2.0]

	section fiberSec  $secID  {
	    patch quadr  $matID  $nfdw $nftw  $y1 $z1 $y1 $z4 $y2 $z4 $y2 $z1
        patch quadr  $matID  $nfbf $nftf  $y2 $z1 $y2 $z2 $y3 $z2 $y3 $z1
	    patch quadr  $matID  $nfbf $nftf  $y2 $z3 $y2 $z4 $y3 $z4 $y3 $z3
	    patch quadr  $matID  $nfdw $nftw  $y3 $z1 $y3 $z4 $y4 $z4 $y4 $z1
	}
	
    } else {
        set hh [expr $h - 2 * $t]

        set y1 [expr  $h/2.0]
        set y2 [expr  $hh/2.0]
        set y3 [expr -$hh/2.0]
        set y4 [expr -$h/2.0]
	
        set bb [expr $b - 2 * $t]
        set z1 [expr -$b/2.0]
        set z2 [expr -$bb/2.0]
        set z3 [expr  $bb/2.0]
        set z4 [expr  $b/2.0]
        
	section fiberSec  $secID  {
	    patch quadr  $matID  $nfdw $nftw  $y1 $z1 $y1 $z4 $y2 $z4 $y2 $z1
        patch quadr  $matID  $nfbf $nftf  $y2 $z1 $y2 $z2 $y3 $z2 $y3 $z1
	    patch quadr  $matID  $nfbf $nftf  $y2 $z3 $y2 $z4 $y3 $z4 $y3 $z3
	    patch quadr  $matID  $nfdw $nftw  $y3 $z1 $y3 $z4 $y4 $z4 $y4 $z1
	}
    }
}
