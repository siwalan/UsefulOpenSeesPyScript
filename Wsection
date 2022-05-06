### Adapted from Wsection.tcl

def Wsection(secID, matID, d, bf, tf, tw, nfdw, nftw, nfbf, nftf,  orient="Strong"):
    
    if (orient == "Weak"):
        dw = d-2*tf
        z1 = -d/2
        z2 = -dw/2
        z3 = dw/2
        z4 = d/2
        
        y1 = bf/2
        y2 = tw/2
        y3 = -tw/2
        y4 = -bf/2
    
        ops.section('Fiber',secID)
        ops.patch('quad',matID, nfbf, nftf, *[y1,z3], *[y1,z4], *[y4,z4], *[y4,z3]);
        ops.patch('quad',matID, nftw, nfdw, *[y2,z3], *[y3,z3], *[y3,z2], *[y2,z2]);
        ops.patch('quad',matID, nfbf, nftf, *[y1,z1], *[y1,z2], *[y4,z2], *[y4,z1]);
        
    else:
        dw = d-2*tf
        y1 = -d/2
        y2 = -dw/2
        y3 = dw/2
        y4 = d/2
        
        z1 = -bf/2
        z2 = -tw/2
        z3 = tw/2
        z4 = bf/2
        
        ops.section('Fiber',secID)
        ops.patch('quad',matID, nfbf, nftf, *[y1,z4], *[y1,z1], *[y2,z1], *[y2,z4]);
        ops.patch('quad',matID, nftw, nfdw, *[y2,z3], *[y2,z2], *[y3,z2], *[y3,z3]);
        ops.patch('quad',matID, nfbf, nftf, *[y3,z4], *[y3,z1], *[y4,z1], *[y4,z4]);
