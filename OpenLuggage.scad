moduleSize = 200; // [50:350]
rows = 1; // [1:20]

module openLuggage(index) {
    translate([index * moduleSize, 0, 0])
        cube([moduleSize, moduleSize, 5], center=false);
}

module cornerBase() {
    linear_extrude(height=5)
        polygon(points=[[0,0], [moduleSize ,0], [moduleSize,moduleSize], [50,moduleSize], [0,moduleSize-50]]);
}

for (r = [0:rows-1])
    if (r == 0)
        cornerBase();

    else if (r == rows -1)
        mirror([1,0,0]) translate([-moduleSize * (r + 1), 0, 0]) cornerBase();
    else
        openLuggage(r);