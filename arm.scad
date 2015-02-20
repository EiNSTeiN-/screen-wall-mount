
module arm() {
	length=80;
	width=36;
	walls=8;
	height=30;
	difference() {
		union() {
			// rounded ends
			translate([0,0,0]) cylinder(r=width/2,h=25, $fn=60);
			translate([length,0,0]) cylinder(r=width/2,h=height, $fn=60);
			// body
			translate([0,width/2-walls-0.2,0]) cube([length, walls, height]);
			translate([0,-width/2+0.2,0]) cube([length, walls, height]);
			for(i=[0:1]) translate([24+24*i,-width/2+walls,walls]) cube([walls, width-(walls*2), height-walls]);
			translate([0,-width/2+walls,0]) cube([length, width-(walls*2), walls]);
			// bearings
			translate([0,0,0]) cylinder(r=28/2,h=12, $fn=60);
			translate([length,0,0]) cylinder(r=28/2,h=12, $fn=60);
		}
		union() {
			// left holes
			translate([0,0,8.3]) cylinder(r=8.4/2,h=25, $fn=60);
			translate([0,0,-1]) cylinder(r=22.2/2,h=8, $fn=60);
			translate([0,0,25-5.5]) cylinder(r=14.5/2, h=5.5+1, $fn=6);
			translate([0,0,7]) cylinder(r1=22.2/2, r2=19/2,h=1, $fn=60);
			// right holes
			translate([length,0,8.3+5]) cylinder(r=8.4/2,h=25+2, $fn=60);
			translate([length,0,-1]) cylinder(r=22.2/2,h=8+5, $fn=60);
			translate([length,0,7+5]) cylinder(r1=22.2/2, r2=19/2,h=1, $fn=60);
			// top of first end
			translate([0,0,25]) cylinder(r1=width/2, r2=width/2+5,h=10, $fn=60);
		}
	}
}

arm();
