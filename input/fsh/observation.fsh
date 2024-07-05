Alias: $sct = http://snomed.info/sct
Alias: $loinc = http://loinc.org

Profile: Parent
Parent: Observation
* code
  * coding
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains loinc 1..* and snomed 0..*

Profile: Child
Parent: Parent
* code
  * coding[loinc] ^patternCoding.system = $loinc
    * system 1..
    * code 1..
  * coding[loinc] contains 
      loinc-sauerstoffsaettigung 1..1 and
      loinc-pulsoximetrie 1..1 
  * coding[loinc][loinc-sauerstoffsaettigung] = $loinc#2708-6
  * coding[loinc][loinc-pulsoximetrie] = $loinc#59408-5
  * coding[snomed] ^patternCoding.system = $sct
    * system 1..
    * code 1..
  * coding[snomed] contains 
      snomed-sauerstoffsaettigung 0..1 and
      snomed-pulsoximetrie 0..1
  * coding[snomed][snomed-sauerstoffsaettigung] = $sct#442476006
  * coding[snomed][snomed-pulsoximetrie] = $sct#431314004
