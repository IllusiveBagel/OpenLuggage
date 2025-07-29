moduleSize = 200; // [50:350]
rows = 1; // [1:20]
columns = 1; // [1:20]
wallHeight = 20; // [5:300]

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

module wall() {
    cube([5, moduleSize, wallHeight], center=false);
}

module wallCorner(rotation) {
    if (rotation == 0) {
        linear_extrude(height=wallHeight)
            polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,5], [50, 5], [5, 50], [5,moduleSize], [0,moduleSize], [0,50]]);
    } else if (rotation == 90) {
        translate([moduleSize * rows, 0, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=wallHeight)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,5], [50, 5], [5, 50], [5,moduleSize], [0,moduleSize], [0,50]]);
    } else if (rotation == 180) {
        translate([moduleSize * rows, moduleSize, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=wallHeight)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,5], [50, 5], [5, 50], [5,moduleSize], [0,moduleSize], [0,50]]);
    } else {
        translate([0, moduleSize, 0])
            rotate([0, 0, rotation])
                linear_extrude(height=wallHeight)
                    polygon(points=[[0,50], [50,0], [moduleSize ,0], [moduleSize,5], [50, 5], [5, 50], [5,moduleSize], [0,moduleSize], [0,50]]);
    }
}

module baseCalculation() {
        for (c = [0:columns-1])
            if (c == 0) {
                for (r = [0:rows-1])
                    if (r == 0) {
                        baseCorner(0);
                    } else if (r == rows - 1) {
                        baseCorner(90);
                    } else {
                        base(r);
                    }
            } else if (c == columns - 1) {
                translate([0, moduleSize * c, 0])
                for (r = [0:rows-1])
                    if (r == 0) {
                        baseCorner(270);
                    } else if (r == rows - 1) {
                        baseCorner(180);
                    } else {
                        base(r);
                    }
            } else {
                translate([0, moduleSize * c, 0])
                for (r = [0:rows-1])
                        base(r);
            }
}

module wallCalculation() {
    translate([0, 0, 5])
    for (c = [0:columns-1])
        if (c == 0) {
            for (r = [0:rows-1])
                if (r == 0) {
                    wallCorner(0);
                } else if (r == rows - 1) {
                    wallCorner(90);
                } else {
                    wall();
                }
        } else if (c == columns - 1) {
            translate([0, moduleSize * c, 0])
            for (r = [0:rows-1])
                if (r == 0) {
                    wallCorner(270);
                } else if (r == rows - 1) {
                    wallCorner(180);
                } else {
                    wall();
                }
        } else {
            translate([0, moduleSize * c, 0])
            for (r = [0:rows-1])
                    wall();
        }
}

baseCalculation();
wallCalculation();