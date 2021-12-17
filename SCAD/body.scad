// Body of ATX Case

atxMountHoles = [
    [0.9, 11.1], [6.1, 11.1], [8.95, 11.1],
    [0.0, 4.9],  [6.1, 4.9],  [8.95, 4.9],
    [0.0, 3.1],  [6.1, 3.1],  [8.95, 3.1],
    [0.0, 0.0],  [6.1, 0.0],  [8.95, 0.0]
];

module atxCylinders(size=3, depth=4) {
    for (i=[0:len(atxMountHoles)-1]) {
        point = atxMountHoles[i];
        translate([22.2682+(point[0]*25.4), 0, 31.51+(point[1]*25.4)]) {
            rotate([90]) cylinder(depth, size/2, size/2);
        }
    }
}

translate([1,1,1]) {
    difference() {
        union() {
            // Base board
            cube([320, 4, 395]);
            
            // ATX Mount points
            atxCylinders(size=7.5, depth=4);
        }
            
        // Holes in base board
        union() {
            // PCIe Backet opening
            translate([10, -1, 15]) {cube([2.1, 6, 148.5]);}
            
            // ATX Mount point holes
            translate([0, 5, 0]) atxCylinders(size=3, depth=10);
        }
    }
}