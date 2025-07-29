module bracket(color="darkgray") {
    color(color, 1.0) difference() {
        linear_extrude(17) polygon([[0, 0], [20, 0], [20, 3], [3, 20], [0, 20]]);
        translate([3,3,2]) cube([20,20,13], false);

        translate([9,-1,8.5]) rotate(90, [-1,0,0]) linear_extrude(22) hull() {
            circle(3);
            translate([3,0,0]) circle(3);
        }

        translate([-1,9,8.5]) rotate(90, [0,1,0]) rotate(90, [0,0,1]) linear_extrude(22) hull() {
            circle(3);
            translate([3,0,0]) circle(3);
        }
    }
}