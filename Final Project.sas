*sample selection;

proc print data=mydata.fifadata;
run;

data fifadata1;
	set mydata.fifadata;
	foot=0;
	agegroup=0;
	wagenumber=compress(wage, 'K');
	wagequan=compress(wagenumber, '€');
	wagegroup=0;

	if 15<=wagequan<=30 then
		wagegroup=1;

	if wagequan>30 then
		wagegroup=2;

	if age>=30 then
		agegroup=1;

	if Preferred_Foot='Right' then
		foot=1;
run;

proc sort data=fifadata1;
	by agegroup foot wagegroup;
run;

proc surveyselect data=fifadata1 method=srs n=50 seed=48 out=mydata.samplefifa;
	strata agegroup foot wagegroup;
run;

*influential points;

proc sgplot data=mydata.samplefifa;
	vbox overall/category=foot;
run;

proc sgplot data=mydata.samplefifa;
	vbox overall/category=agegroup;
run;

proc sgplot data=mydata.samplefifa;
	vbox overall/category=wagegroup;
run;

data fifainfluential;
	set mydata.samplefifa;
	wageage=wagegroup*agegroup;
	wagefoot=wagegroup*foot;
	agefoot=agegroup*foot;
	footwageage=foot*wagegroup*agegroup;
run;

proc sgpanel data=fifainfluential;
	panelby agegroup wagegroup;
	vbox overall/category=wageage;
run;

proc sgpanel data=fifainfluential;
	panelby agegroup foot;
	vbox overall/category=agefoot;
run;

proc sgpanel data=fifainfluential;
	panelby foot wagegroup;
	vbox overall/category=wagefoot;
run;

proc sgpanel data=fifainfluential;
	panelby foot wagegroup agegroup;
	vbox overall/category=footwageage;
run;

*check assumptions;

proc sgpanel data=mydata.samplefifa;
	panelby foot agegroup wagegroup;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby foot agegroup;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby foot wagegroup;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby agegroup wagegroup;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby foot;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby agegroup;
	histogram overall;
	density overall /type=normal;
run;

proc sgpanel data=mydata.samplefifa;
	panelby wagegroup;
	histogram overall;
	density overall /type=normal;
run;

proc anova data=mydata.samplefifa;
	class foot agegroup wagegroup;
	model overall=foot*agegroup*wagegroup;
	means foot*agegroup*wagegroup/ hovtest=bartlett;
	run;

proc anova data=mydata.samplefifa;
	class foot agegroup;
	model overall=foot*agegroup;
	means foot*agegroup/ hovtest=bartlett;
	run;

proc anova data=mydata.samplefifa;
	class agegroup wagegroup;
	model overall=agegroup*wagegroup;
	means agegroup*wagegroup/ hovtest=bartlett;
	run;

proc anova data=mydata.samplefifa;
	class foot wagegroup;
	model overall=foot*wagegroup;
	means foot*wagegroup/ hovtest=bartlett;
	run;
	*anova;

proc anova data=mydata.samplefifa;
	class foot agegroup wagegroup;
	model overall=foot agegroup wagegroup foot*agegroup foot*wagegroup 
		agegroup*wagegroup foot*agegroup*wagegroup;
	run;

proc anova data=mydata.samplefifa;
	class foot agegroup wagegroup;
	model overall=agegroup wagegroup agegroup*wagegroup;
	run;
	*post hoc;

proc anova data=mydata.samplefifa;
	class agegroup wagegroup;
	model overall=agegroup*wagegroup;
	means ageagegroup*wagegroup/ bon cldiff;
	run;

proc anova data=mydata.samplefifa;
	class agegroup wagegroup;
	model overall=agegroup*wagegroup;
	means agegroup*wagegroup/scheffe cldiff;
	run;
	*tukey;

proc anova data=mydata.samplefifa;
	class agegroup wagegroup;
	model overall=agegroup*wagegroup;
	means agegroup*wagegroup/ tukey cldiff;
	run;
