use <hardware/profile.scad>
use <hardware/bracket.scad>

width = 400; // [80:1000]
depth = 300; // [80:1000]
height = 150; // [80:1000]

module frameBase(width, depth) {
    rotate([0,90,0]) translate([-10,10,0]) profile(width);
    rotate([0,90,0]) translate([-10,depth - 10,0]) profile(width);
    rotate([-90,0,0]) translate([10,-10,20]) profile(depth - 40);
    rotate([-90,0,0]) translate([width - 10,-10,20]) profile(depth - 40);
}

module bracketSide(height) {
    translate([1.5, 20, 20]) rotate([90,0,90]) bracket();
    translate([18.5,20,height -20]) rotate([-90,0,90]) bracket();
}

module frame(width, depth, height) {
    frameBase(width, depth);
    translate([10, 10, 20]) profile(height - 40);
    translate([width - 10, 10, 20]) profile(height - 40);
    translate([10, depth - 10, 20]) profile(height - 40);
    translate([width - 10, depth - 10, 20]) profile(height - 40);
    translate([0, 0, height-20]) frameBase(width, depth);

    // Side brackets
    bracketSide(height);
    translate([20,depth,0]) rotate([0,0,180]) bracketSide(height);
    translate([width - 20,0,0]) bracketSide(height);
    translate([width,depth,0]) rotate([0,0,180]) bracketSide(height);

    // Front and back brackets
    translate([0,20,0]) rotate([0,0,-90]) bracketSide(height);
    translate([width,0,0]) rotate([0,0,90]) bracketSide(height);
    translate([0,depth,0]) rotate([0,0,-90]) bracketSide(height);
    translate([width,depth-20,0]) rotate([0,0,90]) bracketSide(height);
}

frame(width, depth, height);