moduleSize = 200; // [50:350]
rows = 1; // [1:20]
columns = 1; // [1:20]

module base(index) {
    translate([index * moduleSize, 0, 0])
        cube([moduleSize, moduleSize, 5], center=false);
}

module baseCorner(rotation) {
    if (rotation == 0) {
        linear_extrude(height=5)
            polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,moduleSize], [50,moduleSize], [0,moduleSize]]);
    } else if (rotation == 90) {
        translate([moduleSize * rows, 0, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=5)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,moduleSize], [50,moduleSize], [0,moduleSize]]);
    } else if (rotation == 180) {
        translate([moduleSize * rows, moduleSize, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=5)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,moduleSize], [50,moduleSize], [0,moduleSize]]);
    } else {
        translate([0, moduleSize, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=5)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,moduleSize], [50,moduleSize], [0,moduleSize]]);
    }
}

module baseCalculation() {
        for (c = [0:columns-1])
            if (c == 0)
                for (r = [0:rows-1])
                    if (r == 0)
                        baseCorner(0);
                    else if (r == rows - 1)
                        baseCorner(90);
                    else
                        base(r);
            else if (c == columns - 1)
                translate([0, moduleSize * c, 0])
                for (r = [0:rows-1])
                    if (r == 0)
                        baseCorner(270);
                    else if (r == rows - 1)
                        baseCorner(180);
                    else
                        base(r);
            else
                translate([0, moduleSize * c, 0])
                for (r = [0:rows-1])
                        base(r);
}
            
baseCalculation();