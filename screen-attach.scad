
module screen_attach()
{
	module plate() {
		difference() {
			union() {
				translate([-50,-50,0]) cube([100,100,8]);
				for(x=[-50,50],y=[-50,50]) translate([x,y,0]) cylinder(r=20,h=8, $fn=80);
			}
			for(x=[-70,70]) translate([x,0,-1]) cylinder(r=72/2,h=10, $fn=80);
			for(y=[-70,70]) translate([0,y,-1]) cylinder(r=72/2,h=10, $fn=80);
			for(x=[-50,50],y=[-50,50]) translate([x,y,-1]) cylinder(r=4.5/2,h=10,$fn=20);
		}

	}

	module angle() {
		rotate([0,0,45]) hull() {
			cylinder(r=8/2,h=40);
			translate([0,0,4]) rotate([0,90,0]) cylinder(r=8/2,h=68);
		}
	}

	difference() {
		union() {
			translate([0,25/2,50]) rotate([90,0,0]) cylinder(r=30/2,h=25,$fn=30);
			translate([-15,-25/2,0]) cube([30,25,50]);
			plate();
			translate([5,-5,0]) rotate([0,0,6]) angle();
			translate([5,5,0]) rotate([0,0,-90-6]) angle();

			translate([-5,-5,0]) rotate([0,0,90-6]) angle();
			translate([-5,5,0]) rotate([0,0,-180+6]) angle();
		}
		translate([0,25/2+1,50]) rotate([90,0,0]) cylinder(r=8/2,h=50,$fn=30);
		translate([0,-25/2+5.5,50]) rotate([90,0,0]) cylinder(r=14.5/2, h=5.5+1, $fn=6);
		translate([0,25/2+1,50]) rotate([90,0,0]) cylinder(r=22.2/2,h=7+1, $fn=60);
		translate([0,25/2-6,50]) rotate([90,0,0]) cylinder(r=13/2, h=2, $fn=60);
	}

}

screen_attach();
