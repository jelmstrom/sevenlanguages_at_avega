module MapColors where


 neighbourCheck  colourAl colourMs colourGe colourTn colourFl = if

 color colours = [
                 [("Al",colourAl),("Ms", colourMs), ("Ge", colourGe), ("Tn", colourTn), ("Fl", colourFl)]
            | colourAl <- colours,   colourMs <- colours, colourGe <- colours ,   colourTn <- colours, colourFl <- colours
               , colourMs /= colourTn
               , colourMs /= colourAl
               , colourAl /= colourTn
               , colourAl /= colourGe
               , colourAl /= colourFl
               , colourGe /= colourFl
               , colourGe /= colourTn
            ]
















