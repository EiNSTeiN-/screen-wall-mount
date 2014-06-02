
module circular_holes_top() {
	for(t=[-90:90]) rotate([0,0,(1*t)]) translate([0,26,0]) cylinder(r=4.5/2,h=20);
	translate([0,-26,0]) cylinder(r=4.5/2,h=20);
}

module circular_holes_bottom() {
	for(t=[-90:90]) rotate([0,0,(1*t)+180]) translate([0,26,4.3]) cylinder(r=4.5/2,h=20);
	for(t=[-30:30]) rotate([0,0,(3*t)+180]) translate([0,26,0]) cylinder(r=9.5/2,h=4);
	translate([0,26,4.3]) cylinder(r=4.5/2,h=20);
	translate([0,26,0]) cylinder(r=8/2,h=4,$fn=6);
}

module plate() {
	difference() {
		union() {
			translate([-50,-50,0]) cube([100,100,8]);
			for(x=[-50,50],y=[-50,50]) translate([x,y,0]) cylinder(r=20,h=8, $fn=80);
			translate([0,0,8]) cylinder(r1=80/2,r2=70/2,h=8);
		}
		union() {
			for(x=[-70,70]) translate([x,0,-1]) cylinder(r=72/2,h=20, $fn=80);
			for(y=[-70,70]) translate([0,y,-1]) cylinder(r=72/2,h=20, $fn=80);
			for(x=[[-50,-30],[50,30]],y=[[-50,-30],[50,30]]) hull() {
				translate([x[0],y[0],-1]) cylinder(r=4.5/2,h=10,$fn=20);
				translate([x[1],y[1],-1]) cylinder(r=4.5/2,h=10,$fn=20);
			}
			translate([0,0,8]) cylinder(r=65.5/2,h=10);
			circular_holes_bottom();
		}
	}
}

module attach() {
	difference() {
		union() {
			translate([0,25/2,35]) rotate([90,0,0]) cylinder(r=30/2,h=25,$fn=30);
			translate([-15,-25/2,0]) cube([30,25,35]);
			hull() {
				translate([-15,-25/2,0]) cube([30,25,18]);
				cylinder(r=42/2,h=8);
			}
			cylinder(r=65/2,h=8);
		}
		union() {
			translate([0,25/2+1,35]) rotate([90,0,0]) cylinder(r=8/2,h=50,$fn=30);
			translate([0,-25/2+5.5,35]) rotate([90,0,0]) cylinder(r=14.5/2, h=5.5+1, $fn=6);
			translate([0,25/2+1,35]) rotate([90,0,0]) cylinder(r=22.2/2,h=7+1, $fn=60);
			translate([0,25/2-6,35]) rotate([90,0,0]) cylinder(r=13/2, h=2, $fn=60);
			circular_holes_top();
		}
	}
}

module display() {
	translate([0,0,8]) attach();
	plate();
}

module print() {
	translate([0,70,0]) attach();
	plate();
}

print();
//display();

