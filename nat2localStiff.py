### Convert the output of ops.basicStiffness() to more common local stifness matrix. Expect a 3x3 input for 2D element.

def nat2localStiff(Knat,L=1.0):    
    Tlocal = np.matrix([[-1, 0, 0, 1, 0, 0],[0, -1/L, 0, 0, 1/L,1],[0, -1/L, 1, 0, 1/L, 0]])
    return (np.transpose(Tlocal) @ Knat @ Tlocal)
