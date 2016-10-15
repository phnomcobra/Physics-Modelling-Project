function data = createBumper(data, a, b)
     
data.bumper(size(data.bumper, 2) + 1).nodes = [a b];