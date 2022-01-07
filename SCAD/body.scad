// Body of ATX Cas
// Units in mm unless otherwise stated

$fn = 10;

atxMountHoles = [ // in inches
    [0.9, 11.1], [6.1, 11.1], [8.95, 11.1], [11.8, 11.1],
    [0.0,  4.9], [6.1,  4.9], [8.95,  4.9], [11.8, 4.9],
    [0.0,  3.1], [6.1,  3.1], [8.95,  3.1], [11.8, 3.1],
    [0.0,  0.0], [6.1,  0.0], [8.95,  0.0], [11.8, 0.0]
];

module atxCylinders(size=3, depth=4) {
    for (i=[0:len(atxMountHoles)-1]) {
        point = atxMountHoles[i];
        translate([0.4*25.4+(point[0]*25.4), 0, 0.65*25.4+(point[1]*25.4)]) {
            rotate([90]) cylinder(depth, size/2, size/2);
        }
    }
}

module atxBoard(insL=375, insW=300, atxBT=6, atxSD=5) {
    difference() {
        // Base board
        difference() {
            cube([insW, atxBT, insL]);
            
            translate([-1, -1, 0]) cube([3, atxBT+2, 155]);
        }
        
        translate([0.1, atxBT+1, 0.1]) atxCylinders(size=atxSD, depth=atxBT+2);
    }
}

module bodyTop(insW=300, insD=172, bodyT=10) {
    cube([insW, insD, bodyT]);
}

module bodyBottom(insW=300, insD=172, bodyT=10) {
    cube([insW, insD, bodyT]);
}

module bodyBack(bodyT=10, insD=172, insL=375) {
    cube([bodyT, insD, insL]);
}

module bodyFront(bodyT=10, insD=172, insL=375) {
    cube([bodyT, insD, insL]);
}

module Body() {
    insL = 375; // inside volume length/height
    insW = 300; // inside volume width
    insD = 175; // inside volume depth
    bodyT = 10; // body side thickness
    atxBT = 6;  // atx board side thickness
    atxSO = 6;  // atx stand off height
    atxSD = 4.5;  // atx stand off diameter
    
    // Sides of the case
    translate([     bodyT, 0, insL+bodyT]) bodyTop(insW, insD, bodyT);
    translate([     bodyT, 0,          0]) bodyBottom(insW, insD, bodyT);
    translate([         0, 0,      bodyT]) bodyBack(bodyT, insD, insL);
    translate([insW+bodyT, 0,      bodyT]) bodyFront(bodyT, insD, insL);
    
    // Edges of the case
    translate([0,          0,          0]) cube([bodyT, insD+atxBT, bodyT]);
    translate([0,          0, insL+bodyT]) cube([bodyT, insD+atxBT, bodyT]);
    translate([insW+bodyT, 0,          0]) cube([bodyT, insD+atxBT, bodyT]);
    translate([insW+bodyT, 0, insL+bodyT]) cube([bodyT, insD+atxBT, bodyT]);
    
    translate([     bodyT, insD,          0]) cube([insW, atxBT, bodyT]);
    translate([     bodyT, insD, insL+bodyT]) cube([insW, atxBT, bodyT]);
    translate([         0, insD,      bodyT]) cube([bodyT, atxBT, insL]);
    translate([insW+bodyT, insD,      bodyT]) cube([bodyT, atxBT, insL]);
    
    // Part with the motherboard
    translate([bodyT, insD, bodyT]) atxBoard(insL, insW, atxBT, atxSD);
}

translate([1,1,1]) {
    Body();
}