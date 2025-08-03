use <Frame.scad>

width = 400; // [80:1000]
depth = 300; // [80:1000]
height = 150; // [80:1000]

module base() {
    translate([5, 5, 0]) cube([width, depth, 5], center=false);
}

module front() {
    translate([5, 0, 5]) cube([width, 5, height], center=false);
}

module side() {
    translate([0, 5, 5]) cube([5, depth, height], center=false);
}

base();
front();
translate([0, depth + 5, 0]) front();
side();
translate([width + 5, 0, 0]) side();
translate([5, 5, 5]) frame(width, depth, height);