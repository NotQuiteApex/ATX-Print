// Body of ATX Cas
// Units in mm unless otherwise stated

use <__helpers__.scad>;

$fn = 20;

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
    difference() {
        cube([insW, insD, bodyT]);
        translate([insW/2, insD/2, bodyT/2]) cube([240, 120, bodyT+2], center=true);
    }
    
    difference() {
        union() {
            // lines for support
            translate([insW/2, insD/2, bodyT*3/4]) cube([10, 120, bodyT/2], center=true);
            //translate([insW/2, insD/2, bodyT*3/4]) cube([240, 10, bodyT/2], center=true);
            
            // triangle bits for mounting
            trisize = 25;
            translate([insW/2-120, insD/2+60-trisize, bodyT]) scale([ 1,  1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2-120, insD/2-60+trisize, bodyT]) scale([ 1, -1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2,     insD/2+60-trisize, bodyT]) scale([-1,  1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2,     insD/2-60+trisize, bodyT]) scale([-1, -1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            
            translate([insW/2+120, insD/2+60-trisize, bodyT]) scale([-1,  1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2+120, insD/2-60+trisize, bodyT]) scale([-1, -1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2,     insD/2+60-trisize, bodyT]) scale([ 1,  1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
            translate([insW/2,     insD/2-60+trisize, bodyT]) scale([ 1, -1, 1]) rotate([0, 90, 0]) prism(bodyT/2, trisize,trisize);
        }
        
        union() {
            translate([insW/2+7.5,     insD/2+60-7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2+7.5,     insD/2-60+7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2+120-7.5, insD/2+60-7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2+120-7.5, insD/2-60+7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2-7.5,     insD/2+60-7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2-7.5,     insD/2-60+7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2-120+7.5, insD/2+60-7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            translate([insW/2-120+7.5, insD/2-60+7.5, bodyT*3/4]) cylinder(bodyT/2+1, 2.5, 2.5, center=true);
            
        }
    }
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

module handleNotch(length=18, outer=30, inner=15) {
    difference() {
        union() {
            translate([0, 0, outer/2]) rotate([-90]) cylinder(length, outer/2, outer/2);
            difference() {
                translate([-outer, 0, 0]) cube([outer*2, length, outer/2]);
                union() {
                    translate([ outer, -1, outer/2]) rotate([-90]) cylinder(length+2, outer/2, outer/2);
                    translate([-outer, -1, outer/2]) rotate([-90]) cylinder(length+2, outer/2, outer/2);
                }
            }
        }
        translate([0, -1, outer/2]) rotate([-90]) cylinder(length+2, inner/2, inner/2);
    }
}

module Body() {
    insL = 375; // inside volume length/height
    insW = 300; // inside volume width
    insD = 175; // inside volume depth
    bodyT = 10; // body side thickness
    atxBT = 4;  // atx board side thickness
    atxSO = 6;  // atx stand off height
    atxSD = 5;  // atx stand off diameter
    
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

    // Handle notches
    translate([             0, (insD+atxBT)/2, (insL+bodyT*2)]) rotate([0,0, -90]) handleNotch();
    translate([(insW+bodyT*2), (insD+atxBT)/2, (insL+bodyT*2)]) rotate([0,0,  90]) handleNotch();
}

translate([1,1,1]) {
    Body();
}