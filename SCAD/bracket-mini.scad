module mini_bracket() {
    translate([-6, -4.5/2, 0]) {
        translate([4.5/2, 0, 0]) cube([8, 4.5, 2]);
        translate([4.5/2, 4.5/2, 0]) cylinder(12, 4.5/2, 4.5/2);
        translate([4.5/2+8, 4.5/2, 0]) cylinder(12, 4.5/2, 4.5/2);
    }
}

mini_bracket();