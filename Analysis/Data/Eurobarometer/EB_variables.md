# Lists the variables that need to be extracted from the EB data sets

Below are the variables which I extracted from the Eurobarometers and pasted together in a single Eurobarometer Euroscepticism file for aggregation of Eurosceptic attitudes first and

#### Spring 1979
**v7 isocntry**
FR = France
etc.

**v8 - NATION**
NATION (OF INTERVIEW)
1 FRANCE
2 BELGIUM
3 NETHERLANDS
4 GERMANY
5 ITALY
6 LUXEMBOURG
7 DENMARK
8 IRELAND
9 GREAT BRITAIN
10 NORTHERN IRELAND

**No year variable included**
I need to code it myself with EB1979$year <- 1979

**v94 Q.222**
GENERALLY SPEAKING, DO YOU THINK THAT (COUNTRY'S) MEMBERSHIP OF THE COMMON MARKET IS A GOOD THING,
A BAD THING, OR NEITHER GOOD NOR BAD?
0 DK; NA
1 GOOD THING
2 NEITHER GOOD NOR BAD
3 BAD THING

**v95 Q.223**
AND DO YOU THINK THAT MEMBERSHIP OF THE COMMON MARKET IS A GOOD THING, A BAD THING,OR NEITHER A
GOOD NOR BAD THING IN THE LIGHT OF (COUNTRY'S) FUTURE IN THE NEXT 10 OR 15 YEARS?
0 DK; NA
1 GOOD THING
2 NEITHER GOOD NOR BAD
3 BAD THING

#### Spring 1984
**v5 - NATION I (UNITED KINGDOM)**
NATION (OF INTERVIEW, WITH A SINGLE CODE FOR U.K.)
THIS IS A TEN-CATEGORY VARIABLE WHICH CONTAINS ONE CODE FOR EACH MEMBER NATION OF THE EUROPEAN
COMMUNITY. THIS NATION I.D. VARIABLE SHOULD BE USED IN CONJUNCTION WITH NATION WEIGHT I (VAR. NO. 6). FOR
AN ELEVEN-CATEGORY VARIABLE WHICH SEPARATES RESPONDENTS IN NORTHERN IRELAND FROM THOSE IN GREAT
BRITAIN, SEE VAR. NO. 7.
1 FRANCE
2 BELGIUM
3 NETHERLANDS
4 GERMANY
5 ITALY
6 LUXEMBOURG
7 DENMARK
8 IRELAND
9 UNITED KINGDOM
10 GREECE


**v189 - Q341 EC MEMBERSHIP - GOOD/BAD**
Q.341
GENERALLY SPEAKING, DO YOU THINK THAT (YOUR COUNTRY'S) MEMBERSHIP IN THE EUROPEAN COMMUNITY
(COMMON MARKET) IS...
0 DK; NA
1 GOOD THING
2 BAD THING
3 NEITHER GOOD NOR BAD

**v190 Q.342A**
TAKING EVERYTHING INTO CONSIDERATION, WOULD YOU SAY THAT (YOUR COUNTRY) HAS ON BALANCE BENEFITED
OR NOT FROM BEING A MEMBER OF THE EUROPEAN COMMUNITY (COMMON MARKET)?

#### Spring 1989
**isocntry - NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)**
NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)
All surveyed countries and regions, i.e. including separate samples for East- / West-Germany, Great Britain / Northern Ireland, and
the Turkish Cypriot Community (TCC), are coded in accordance with the ISO 3166-1-alpha-2 country code, if available. ISO 3166-2 is
applied for the United Kingdom subdivisions. ISO standard codes are not available for the “historical” East / West subdivision of
Germany (DE-E / DE-W) and for the Turkish Cypriot Community in northern Cyprus (CY-TCC), the internationally not recognized
“Turkish Republic of Northern Cyprus”.


**v5 - NATION I (UNITED KINGDOM)**
NATION OF INTERVIEW I
THIS VARIABLE IDENTIFIES THE EUROPEAN COMMUNITY NATION WHERE THE RESPONDENT WAS INTERVIEWED. A
UNIQUE NUMERIC CODE IS ASSIGNED TO EACH OF THE 12 EUROPEAN COMMUNITY COUNTRIES.
1 FRANCE
2 BELGIUM
3 NETHERLANDS
4 GERMANY
5 ITALY
6 LUXEMBOURG
7 DENMARK
8 IRELAND
9 UNITED KINGDOM
10 GREECE
11 SPAIN
12 PORTUGAL


**v273 Q.374**
GENERALLY SPEAKING, DO YOU THINK THAT (YOUR COUNTRY'S) MEMBERSHIP OF THE EUROPEAN COMMUNITY
(COMMON MARKET) IS...
0 DK/NA
1 GOOD THING
2 NEITHER GOOD NOR BAD
3 BAD THING

**v274 Q.375**
TAKING EVERYTHING INTO CONSIDERATION, WOULD YOU SAY THAT (YOUR COUNTRY) HAS ON BALANCE BENEFITED
OR NOT FROM BEING A MEMBER OF THE EUROPEAN COMMUNITY (COMMON MARKET)?
0 DK/NA
1 BENEFITED
2 NOT BENEFITED

#### Spring 1994
**isocntry - NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)**
NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)
All surveyed countries and regions, i.e. including separate samples for East- / West-Germany, Great Britain / Northern Ireland, and
the Turkish Cypriot Community (TCC), are coded in accordance with the ISO 3166-1-alpha-2 country code, if available. ISO 3166-2 is
applied for the United Kingdom subdivisions. ISO standard codes are not available for the “historical” East / West subdivision of
Germany (DE-E / DE-W) and for the Turkish Cypriot Community in northern Cyprus (CY-TCC), the internationally not recognized
“Turkish Republic of Northern Cyprus”.

**v5 - NATION I (UNITED KINGDOM)**
Nation of interview
This variable identifies the E.C. nation in which the respondent was interviewed. A unique numeric code is assigned to each of the 12
E.C. countries.
1 France
2 Belgium
3 Netherlands
4 West Germany
5 Italy
6 Luxembourg
7 Denmark
8 Ireland
9 United Kingdom
10 Greece
11 Spain
12 Portugal
13 East Germany
14 Norway
15 Finland

**v61 - Q19 EC MEMBERSHIP - GOOD/BAD**
Q.19
Generally speaking, do you think that (OUR COUNTRY'S) membership of the ( EC & EU (EC) ) is ... ?
(READ OUT)
0 NA
1 A good thing
2 A bad thing
3 Neither good nor bad
4 DK

**v62 - Q20 EC MEMBERSHIP - COUNTRY BENEFIT**
Q.20
Taking everything into consideration, would you say that (OUR COUNTRY) has on balance benefited or not from being a member of
the ( EC & EU (EC) ) ?
0 NA
1 Benefited
2 Not benefited
3 DK


#### Spring 1999
**isocntry - NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)**
NATION - ALL SAMPLES ISO 3166 (CROSSTABULATION VARIABLE)
All surveyed countries and regions, i.e. including separate samples for East- / West-Germany, Great Britain / Northern Ireland, and
the Turkish Cypriot Community (TCC), are coded in accordance with the ISO 3166-1-alpha-2 country code, if available. ISO 3166-2 is
applied for the United Kingdom subdivisions. ISO standard codes are not available for the “historical” East / West subdivision of
Germany (DE-E / DE-W) and for the Turkish Cypriot Community in northern Cyprus (CY-TCC), the internationally not recognized
“Turkish Republic of Northern Cyprus”.

**v6 - NATION I (UNITED KINGDOM)**
Nation of Interview I
15 EC countries including separate samples for East and West Germany.
1 France
2 Belgium
3 The Netherlands
4 Germany (West)
5 Italy
6 Luxembourg
7 Denmark
8 Ireland
9 United Kingdom
10 Greece
11 Spain
12 Portugal
13 Germany (East)
14 Norway (not included)
15 Finland
16 Sweden
17 Austria

**v104 - Q10 EU MEMBERSHIP - GOOD/BAD**
Q.10
Generally speaking, do you think that (OUR COUNTRY'S) membership of the European Union is ...?
(READ OUT)
0 NA
1 Good thing
2 Neither good nor bad (questionnaire code 3)
3 Bad thing (questionnaire code 2)
4 DK

**v105 - Q11 EU MEMBERSHIP - CNTRY BENEFIT**
Q.11
Taking everything into consideration, would you say that (OUR COUNTRY) has on balance benefitted or not from being a member of
the European Union ?
0 NA
1 Benefited
2 Not benefited
3 DK



# Fall 2004
_I used the fall Eurobarometer just once because the 2004 wave of Member States were not yet included in the summer barometer_

**v6 - NATION - ALL SAMPLES**
NATION - ALL SAMPLES
All samples including separate samples for East and West Germany and for Great Britain and Northern Ireland.
1 France
2 Belgium
3 The Netherlands
4 Germany West
5 Italy
6 Luxembourg
7 Denmark
8 Ireland
9 Great Britain
10 Northern Ireland
11 Greece
12 Spain
13 Portugal
14 Germany East
15 Norway (not included)
16 Finland
17 Sweden
18 Austria
19 Cyprus (Republic)
20 Czech Republic
21 Estonia
22 Hungary
23 Latvia
24 Lithuania
25 Malta
26 Poland
27 Slovakia
28 Slovenia
29 Bulgaria
30 Romania
31 Turkey
32 Croatia
33 Cyprus (TCC)

**v7 - NATION - ALL SAMPLES ISO 3166**
NATION - ALL SAMPLES ISO 3166
All surveyed countries and regions, i.e. including separate samples for East- / West-Germany, Great Britain / Northern Ireland, and
the Turkish Cypriot Community (TCC), are coded in accordance with the ISO 3166-1-alpha-2 country code, if available. ISO 3166-2 is
applied for the United Kingdom subdivisions. ISO standard codes are not available for the “historical” East / West subdivision of
Germany (DE-E / DE-W) and for the Turkish Cypriot Community in northern Cyprus (CY-TCC), the internationally not recognized
“Turkish Republic of Northern Cyprus”.

**v98 - Q11 EU MEMBERSHIP - GOOD/BAD**
Let's continue with some questions on the European Union.
Q.11
DO NOT ASK in BG, RO, TR, HR and CY_TR
Generally speaking, do you think that (OUR COUNTRY)'s membership of the European Union is...?
(READ OUT)
1 Good thing
2 Neither good nor bad (questionnaire code 3)
3 Bad thing (questionnaire code 2)
4 DK
9 Inap. (coded 29 to 33 in V6)

**v99 - Q12 EU MEMBERSHIP - CNTRY BENEFIT**
Q.12
DO NOT ASK in BG, RO, TR, HR and CY_TR
Taking everything into consideration, would you say that (OUR COUNTRY) has on balance benefited or not from being a member of
the European Union?
1 Benefited
2 Not benefited
3 DK
9 Inap. (coded 29 to 33 in V6)
Note:
Last trend: EB61, Q.9
