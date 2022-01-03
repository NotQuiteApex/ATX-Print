// Body of ATX Cas
// Units in mm unless otherwise stated

atxMountHoles = [ // in inches
    [0.9, 11.1], [6.1, 11.1], [8.95, 11.1],
    [0.0,  4.9], [6.1,  4.9], [8.95,  4.9],
    [0.0,  3.1], [6.1,  3.1], [8.95,  3.1],
    [0.0,  0.0], [6.1,  0.0], [8.95,  0.0]
];

module atxCylinders(size=3, depth=4) {
    for (i=[0:len(atxMountHoles)-1]) {
        point = atxMountHoles[i];
        translate([0.4*25.4+(point[0]*25.4), 0, 0.65*25.4+(point[1]*25.4)]) {
            rotate([90]) cylinder(depth, size/2, size/2);
        }
    }
}

module atxBoard() {
    difference() {
        // Base board
        difference() {
            cube([300, 6, 375]);
            
            translate([-1, -1, 0]) cube([3.1, 8, 155]);
        }
        
        translate([0.1, 6, 0.1]) atxCylinders(size=3, depth=8);
    }
}

module bodyTop() {
    cube([300, 172, 10]);
}

module bodyBottom() {
    cube([300, 172, 10]);
}

module bodyBack() {
    cube([10, 172, 375]);
}

module bodyFront() {
    cube([10, 172, 375]);
}

module Body() {
    // Sides of the case
    translate([10, 0, 375+10]) bodyTop();
    translate([10, 0, 0]) bodyBottom();
    translate([0, 0, 0+10]) bodyBack();
    translate([300+10, 0, 0+10]) bodyFront();
    
    // Edges of the case
    translate([0,      0,      0]) cube([10, 172+6, 10]);
    translate([0,      0, 375+10]) cube([10, 172+6, 10]);
    translate([300+10, 0,      0]) cube([10, 172+6, 10]);
    translate([300+10, 0, 375+10]) cube([10, 172+6, 10]);
    
    translate([10, 172,      0]) cube([300, 6, 10]);
    translate([10, 172, 375+10]) cube([300, 6, 10]);
    translate([0, 172, 10]) cube([10, 6, 375]);
    translate([300+10, 172, 10]) cube([10, 6, 375]);
    
    // Part with the motherboard
    translate([10, 172, 0+10]) atxBoard();
}

translate([1,1,1]) {
    Body();
}