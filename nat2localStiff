def nat2localStiff(Knat,L=1.0):    
    Tlocal = np.matrix([[-1, 0, 0, 1, 0, 0],[0, -1/L, 0, 0, 1/L,1],[0, -1/L, 1, 0, 1/L, 0]])
    return (np.transpose(Tlocal) @ Knat @ Tlocal)
