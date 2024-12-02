--Find the names of the professors in 'ITEC' departments. 	
xquery
let $c:=doc("/public/grp1_folder/2022Professors.xml")
for $d in $c/ProfessorList/Professor
where $d/DepID='DITEC'
return $d/Name/text()
/
--Find the students in "Home" Faculty.		
xquery
let $s:=doc("/public/grp1_folder/2022Students.xml")
for $sl in $s/StudentList/Student
where $sl/FacID="FHo"
return $sl/Name/text()
/


--Find the Credit Requirements for the Degree of the student with SID='217457527' 

xquery
let $s:=doc("/public/grp1_folder/2022Students.xml")
for $sl in $s/StudentList/Student
let $d:=doc("/public/grp1_folder/2022DegreePrograms.xml")
for $dg in $d/DegreePrograms/DegreeProgram
where $sl/@StudentID="217457527" and $dg/@DPID=$sl/DegreeProgram
return $dg/CredReq/text()
/


--Find the courses with FLAPS faculty		
xquery
let $c:=doc("/public/grp1_folder/2022Courses.xml")
for $cl in $c/Courses/CourseID
where $cl/FacultyID ='FLAPS'
return $cl/@CourseID
/


--Find the degree programs with a GPA requirement over 70		
xquery
let $d:=doc("/public/grp1_folder/2022DegreePrograms.xml")
for $dg in $d/DegreePrograms/DegreeProgram
where $dg/GPAReq>70	
return $dg/@DPID
/

--Find the degrees that have a degree requisite of COOK1000	
xquery
let $d:=doc("/public/grp1_folder/2022DegreeRequisites.xml")
for $dr in $d/DegreeRequirements/DegreeProgram
where $dr/CID='COOK1000'
return $dr/@DPID
/
--Find the students who are taking ITEC 2620A in there transcript	
xquery
let $s:=doc("/public/grp1_folder/2022Students.xml")
for $sl in $s/StudentList/Student
let $t:=doc("/public/grp1_folder/2022Transcript.xml")
for $tl in $t/StudentList/Student
where $sl/@StudentID=$tl/@SID and $tl/SectionID = "ITEC2620A"
return $sl/@StudentID
/


--Find Sections with an end date of Dec 3 
xquery
let $w:=doc("/public/grp1_folder/2022Sections.xml")
for $wl in $w/SectionList/Section
where $wl/EndDate="Dec3"
return $wl/@SectionID
/

--Find the professor with ProfID=”320809554’’ and their sections 
xquery
let $x:=doc("/public/grp1_folder/2022Professors.xml")
for $xl in $x/ProfessorList/Professor
let $z:=doc("/public/grp1_folder/2022Sections.xml")
for $zl in $z/SectionList/Section
where $xl/@ProfessorID="320809554" and $zl/ProfID=$xl/@ProfessorID
return $zl/@SectionID
/

--Find the courses that are in the “DCo” department 
xquery
let $c:=doc("/public/grp1_folder/2022Courses.xml")
for $cl in $c/Courses/CourseID
where $cl/DepartmentID="DCo"
return $cl/@CourseID
/

--Find the courses that have a room id of ‘VH5’ 

xquery
let $s:=doc("/public/grp1_folder/2022Sections.xml")
for $sl in $s/SectionList/Section
where $sl/RoomID="VH5" 
return $sl/@SectionID
/


--Find the IDs of students that have achieved a grade higher than 80 in a course. 
xquery
distinct-values(
let $t:=doc("/public/grp1_folder/2022Transcript.xml")
for $ts in $t/StudentList/Student
where $ts/Grade>80
return $ts/@SID
)
/

--Find the names of students whose grades are higher than 89. 

xquery
let $s:=doc("/public/grp1_folder/2022Students.xml")
for $sl in $s/StudentList/Student
let $t:=doc("/public/grp1_folder/2022Transcript.xml")
for $tl in $t/StudentList/Student
where $sl/@StudentID=$tl/@SID and $tl/Grade > 89
return $sl/Name 
/
