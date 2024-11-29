/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */

psdes_dev_msg = "Design and Developed by PS Design | psdes.eu";
if (typeof prestashop !== 'undefined' && typeof prestashop.language !== 'undefined' &&
    prestashop.language.iso_code === 'pl') {
    psdes_dev_msg = "Projekt i Realizacja PS Design | psdes.eu";
}

console.log("- - - - - - - - - - - - - - - - - - - - - - -");
console.log(psdes_dev_msg);
console.log("- - - - - - - - - - - - - - - - - - - - - - -");

