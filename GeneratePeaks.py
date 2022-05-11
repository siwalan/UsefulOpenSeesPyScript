#### Adapted from the original 'GeneratePeaks.tcl' code by Silvia Mazzoni, 2006. 
## However, instead of writing the displacement load history into a output file. It will return a list.

def GeneratePeaks(Dmax, DincrStatic=0.1, CycleType="Full",Factor=1):
    Disp_List = []
    Dmax = Dmax*Factor;
    Disp = 0;
    if (Dmax <0):
        dx = -1*abs(DincrStatic);
    else:
        dx = abs(DincrStatic);
    
    NstepsPeak = int(abs(Dmax)/DincrStatic)
    
    for i in range(1,NstepsPeak+1):
        Disp = Disp + dx
        Disp_List.extend([Disp])
    if (CycleType != "Push"):
        for i in range(1,NstepsPeak+1):
            Disp = Disp - dx
            Disp_List.extend([Disp])

    if (CycleType != "Half"):
        for i in range(1,NstepsPeak+1):
            Disp = Disp - dx
            Disp_List.extend([Disp])

        for i in range(1,NstepsPeak+1):
            Disp = Disp + dx
            Disp_List.extend([Disp])
    
    return Disp_List
