
module plate() {
	distance=20;
	difference() {
		union() {
			// plate with nice rounded edge
			hull() {
				minkowski() {
					cube([60, 60, 12]);
					cylinder(r=8, h=1, $fn=60);
				}
			}
			// main block
			hull() {
				*translate([4,60/2-36/2,12]) cube([22, 36, 30]);
				translate([4,60/2-40/2,12]) cube([54, 40, 2]);
				translate([4,60/2,12+distance]) rotate([0,90,0]) cylinder(r=45/2,h=22, $fn=12);
			}
			translate([4,60/2,12+distance]) rotate([0,90,0]) cylinder(r=45/2,h=18, $fn=60);
			// bearing
			translate([4+12,60/2,12+distance]) rotate([0,90,0]) cylinder(r=45/2,h=10, $fn=60);
		}
		union() {
			// main screw
			translate([4-1,60/2,12+distance]) rotate([0,90,0]) cylinder(r=8.4/2,h=25, $fn=60);
			// bearing
			translate([4+12+3,60/2,12+distance]) rotate([0,90,0]) cylinder(r=22.2/2,h=40, $fn=60);
			hull() for(z=[0,20])
				translate([4+12+3+7,60/2,12+distance+z]) rotate([0,90,0]) cylinder(r=22.2/2,h=40, $fn=60);
			translate([4+12+2,60/2,12+distance]) rotate([0,90,0]) cylinder(r=13/2, h=2, $fn=60);
			// wall screws
			translate([0,0,-1]) cylinder(r=4/2, h=12+2, $fn=60);
			translate([0,60,-1]) cylinder(r=4/2, h=12+2, $fn=60);
			translate([60,0,-1]) cylinder(r=4/2, h=12+2, $fn=60);
			translate([60,60,-1]) cylinder(r=4/2, h=12+2, $fn=60);
		}
	}
}

plate();

