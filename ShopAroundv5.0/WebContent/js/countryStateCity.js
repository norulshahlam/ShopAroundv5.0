// State lists
var states = new Array();
states['India'] = new Array('Maharashtra','Jammu Kashmir','Tamil Nadu','Rajastha','Madhya Pradesh','Uttar Pradesh','Karnataka','Gujarat','Andhra Pradesh','Punjab','Haryana','West Bengal','Assam','Kerala','Jharkhand','Chattisgarh','New Delhi','Puducherry','Goa','Nagaland','Manipur');
states['Canada'] = new Array('Alberta','British Columbia','Ontario');
states['Mexico'] = new Array('Baja California','Chihuahua','Jalisco','Sinaloa');
states['United States'] = new Array('California','Florida','New York','Alabama','Alaska');


// City lists
var cities = new Array();

cities['India'] = new Array();
cities['India']['Maharashtra'] = new Array('Mumbai','Pune','Nagpur','Amravati','Kolhapur','Aurangabad','Solapur','Nashik','Nanded','Kolhapur','Chandrapur','Latur','Amravati','Akola','Ahmednagar');
cities['India']['Jammu Kashmir'] = new Array('Sri Nagar','Jammu','Anantnag');
cities['India']['Tamil Nadu'] = new Array('chennai','coimbatore','Tirunelveli','salem','Madurai','Tiruchirappalli','Erode','Thoothukkudi','Thanjavur','Vellore','Tiruppur','Dindigul','Thanjavur');
cities['India']['Kerala'] = new Array('Kochi','Alappuzha','Alleppey','Kollam','Thrissur','Alwaye','Tirur','Kozikode');
cities['India']['Rajasthan'] = new Array('Jaipur','Jodhpur','Jaisalmer','Ajmer','Udaipur','Alwar','Sikar','Barmer');
cities['India']['Madhya Pradesh'] = new Array('Indore','Bhopal','Jabalpur','Gwalior','Sagar','Dewas','Rewa','Satna','Singrauli');
cities['India']['Uttar Pradesh'] = new Array('Allahabad','Kanpur','Lucknow','Varanasi','Jhansi','Aligarh','Allahabad');
cities['India']['Karnataka'] = new Array('Manipal','Banglore','Hubli','Mangalore','Gulbaraga','Davangere','Mysore');
cities['India']['Gujarat'] = new Array('Ahmedabad','Surat','Vadodara','Rajkot','Jamnagar','Nadiad','Morvi');
cities['India']['Andhra Pradesh'] = new Array('Tirupati','Guntur','Kurnool','Rajamundry','Kadapa','Eluru','Adoni','Vijayawada','Vishakapatnam');
cities['India']['Punjab'] = new Array('Ludhiana','Amristar','Jalandhar','Patiala','Sangrur','Khanna','Rajpura','Firozpur','Abohar','Muktasar');
cities['India']['Haryana'] = new Array('Faridabad','Gurgaon','Panipat','Ambala','Hisar','Karnal','Sirsa','Jind','Palwal','Thanesar');
cities['India']['Puducherry'] = new Array('Karaikal','Mahe','Yanam');
cities['India']['Goa'] = new Array('Panaji','Calangute','Vasco da Gama','Margoa','Mapusa');
cities['India']['Assam'] = new Array('Guwahati','Silchar','Dibrugarh','Jorhat Town','Nagaon','Tezpur');
cities['India']['West Bengal'] = new Array('Kolkata','Asansol','Siliguri','Durgapur','Malda','Habra','Jalpaiguri','Dhulian','Dankuni');
cities['India']['Jharkhand'] = new Array('Jamshedpur','Dhanbad','Ranchi','Giridih','Ramgarh','Chirkunda','Deoghar','Medininagar');
cities['India']['New Delhi'] = new Array('Shahdara','Mehrauli','Siri','Shahjehabanad','Tughlakabad','Lal Kot or Qila Rai Pithora');
cities['India']['Chattisgarh'] = new Array('Korba','Bilaspur','Raipur','Durg-Bhilai','Dhamtari','Ambilkapur','Rajnandgaon','Raigarh');
cities['India']['Nagpur'] = new Array('Bhiwapur','Chicholi','Davlameti','Digdoh','Kamptee','Kandri','Katol','Kalameshwar','Kanhan');

cities['Canada'] = new Array();
cities['Canada']['Alberta']          = new Array('Edmonton','Calgary','Airdrie','Cold Lake','Fort Saskatchewan','Camrose','Leduc','Lethbridge','Medicine Hat','Red Deer');
cities['Canada']['British Columbia'] = new Array('Victoria','Vancouver','Armstrong','Burnaby','Chilliwack','Coquitlam','Courtenay','Prince George','Revelstoke');
cities['Canada']['Ontario']          = new Array('Toronto','Hamilton','Belleville','Burlington','Clarence-Rockland','Cornwall','Kenora','North Bay','Kawartha Lakes','Woodstock');

cities['Mexico'] = new Array();
cities['Mexico']['Baja California'] = new Array('Tijauna','Mexicali','Ensenada','Rosarito','Tecate','San Felipe','Santa Isabel');
cities['Mexico']['Chihuahua']       = new Array('Ciudad Juárez','Chihuahua','lumina tower','corporativo roma','Asta bandera');
cities['Mexico']['Jalisco']         = new Array('Guadalajara','Chapala','Zapopan','Tlaquepaque','Tonalá','Puerto Vallarta');
cities['Mexico']['Sinaloa']         = new Array(' Culiacán','Los Mochis','Mazatlán');

cities['United States'] = new Array();
cities['United States']['California'] = new Array('Los Angeles','San Francisco','Alameda','Aliso Viejo','Anderson','Arcadia','Arcata');
cities['United States']['Florida']    = new Array('Miami','Orlando','Jacksonville','South Beach','Okahumpka','Jupiter Inlet Colony','Key Biscayne');
cities['United States']['New York']   = new Array('Buffalo','new York');
cities['United States']['Alabama']    = new Array('Adamsville','Akron','Addison','Albertville','Altoona','Daleville','Cuba');
cities['United States']['Alaska']     = new Array('Anchorage','Fairbanks','Sitka','Ketchikan','Soldotna','Valdez');



function setStates() {
  cntrySel = document.getElementById('country');
  stateList = states[cntrySel.value];
  changeSelect('state', stateList, stateList);
  setCities();
}

function setCities() {
  cntrySel = document.getElementById('country');
  stateSel = document.getElementById('state');
  cityList = cities[cntrySel.value][stateSel.value];
  changeSelect('city', cityList, cityList);
}

function changeSelect(fieldID, newOptions, newValues) {
  selectField = document.getElementById(fieldID);
  selectField.options.length = 0;
  for (i=0; i<newOptions.length; i++) {
    selectField.options[selectField.length] = new Option(newOptions[i], newValues[i]);
  }
}

// Multiple onload function created by: Simon Willison
// http://simonwillison.net/2004/May/26/addLoadEvent/
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  setStates();
});

