/*
Eric Pan
PSET 4
*/

use star.dta, clear

summarize teacher_experience

gen some_experience = 0
replace some_experience = 1 if teacher_experience < (9.326095+5.761549) & teacher_experience > (9.326095-5.761549)

regress math class_size if some_experience == 1 & teacher_masters == 0
regress read class_size if some_experience == 1 & teacher_masters == 0
regress listen class_size if some_experience == 1 & teacher_masters == 0

twoway (scatter listen class_size) (scatter read class_size) (scatter math class_size) if some_experience == 1 & teacher_masters == 0

regress math class_size if some_experience == 1 & teacher_masters == 1
