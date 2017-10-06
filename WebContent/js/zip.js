var zips = new Array();
var cities = new Array();
var states = new Array();

zips[0] = 560079;
cities[0] = 'Bangalore';
states[0] = 'Karnataka';
zips[1] = 573201;
cities[1] = 'Hassan';
states[1] = 'Karnataka';
zips[2] = 670001;
cities[2] = 'Kannur';
states[2] = 'Kerala';
zips[3] = 670571;
cities[3] = 'Alakode';
states[3] = 'Kerala';
zips[4] = 695581;
cities[4] = 'Kazhakootam';
states[4] = 'Kerala';

zips[5] = 110018;
cities[5] = 'Ashok Nagar';
states[5] = 'Delhi';

zips[6] = 110051;
cities[6] = 'Krishan Nagar';
states[6] = 'Delhi';

zips[7] = 110001;
cities[7] = 'Parliament Street';
states[7] = 'Delhi';

zips[8] = 400059;
cities[8] = 'JB Nagar';
states[8] = 'Maharashtra';

zips[9] = 400035;
cities[9] = 'Rajbhavan';
states[9] = 'Maharashtra';

zips[10] = 400028;
cities[10] = 'Gokhale Road';
states[10] = 'Maharashtra';

zips[11] = 31001;
cities[11] = 'Udaipur';
states[11] = 'Rajasthan';

zips[12] = 132103;
cities[12] = 'Panipat';
states[12] = 'Haryana';

function populateFields(zip) {
	if (zip > 99999) { // check to ensure zip is 6 digits
		for (i = 0; i < zips.length; i++) {
			if (zip == zips[i]) {
				blahForm.city.value = cities[i];
				blahForm.state.value = states[i];
			}
		}
	} else {
		blahForm.city.value = '';
		blahForm.state.value = '';
	}
}
