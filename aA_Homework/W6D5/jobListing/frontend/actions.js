
window.selectLocation = function(city, jobs) {
  return {type: "SWITCH_LOCATION", city: city, jobs: jobs};
};