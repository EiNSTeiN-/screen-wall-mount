
module plate(top=false) {
	difference() {
		union() {
			translate([-50,-50,0]) cube([100,100,8]);
			for(x=[-50,50],y=[-50,50]) translate([x,y,0]) cylinder(r=20,h=8, $fn=80);
		}
		union() {
			for(x=[-70,70]) translate([x,0,-1]) cylinder(r=72/2,h=20, $fn=80);
			for(y=[-70,70]) translate([0,y,-1]) cylinder(r=72/2,h=20, $fn=80);
			for(x=[[-50,-30],[50,30]],y=[[-50,-30],[50,30]]) hull() {
				translate([x[0],y[0],-1]) cylinder(r=4.5/2,h=10,$fn=20);
				translate([x[1],y[1],-1]) cylinder(r=4.5/2,h=10,$fn=20);
			}
			translate([0,0,4.9]) cylinder(r=65.5/2,h=6, $fn=80);
			if(top) {
				translate([0,0,-8]) cylinder(r=21.5,h=30, $fn=80);
			}
		}
	}
}

module attach() {
	difference() {
		union() {
			translate([0,25/2,45]) rotate([90,0,0]) cylinder(r=30/2,h=25,$fn=80);
			translate([-15,-25/2,0]) cube([30,25,45]);
			hull() {
				translate([-15,-25/2,0]) cube([30,25,20]);
				cylinder(r=42/2,h=5+6, $fn=60);
			}
			cylinder(r=65/2,h=6, $fn=80);
		}
		union() {
			translate([0,25/2+1,45]) rotate([90,0,0]) cylinder(r=8/2,h=50,$fn=30);
			translate([0,-25/2+5.5,45]) rotate([90,0,0]) cylinder(r=14.5/2, h=5.5+1, $fn=6);
			translate([0,25/2+1,45]) rotate([90,0,0]) cylinder(r=22.2/2,h=7+1, $fn=60);
			translate([0,25/2-6,45]) rotate([90,0,0]) cylinder(r=13/2, h=2, $fn=60);
		}
	}
}

module display() {
	translate([0,0,6]) attach();
	translate([0,0,16]) rotate([0,180,0]) plate(top=true);
	plate();
}

module print() {
	translate([0,72,0]) attach();
	translate([0,144,0]) plate(top=true);
	plate();
}

print();
*display();

