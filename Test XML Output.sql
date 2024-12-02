----Listof Students

SELECT XMLROOT
(XMLELEMENT("StudentList", 
XMLAGG(XMLELEMENT("Student", XMLATTRIBUTES(s.sid as "StudentID") 
,XMLAGG(XMLFOREST(s.name as "Name", s.SIN as "SIN", s.PNumber as "PhoneNumber", s.PrefEmail as "Email", s.EContacts as "Contacts", s.Banking as "Bank",s.dpoid.DegreeID as "DegreeProgram", s.foid.FacultyID as "FacID"))
))), version '1.0') as RESULT from Student s GROUP BY s.sid;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Students.xml','
<StudentList>
  <Student StudentID="214334587">
    <Name>Brian Musa</Name>
    <SIN>954615648</SIN>
    <PhoneNumber>2890040808</PhoneNumber>
    <Email>brimu@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>TDBank</Bank>
    <DegreeProgram>BA_ITEC</DegreeProgram>
    <FacID>FGS</FacID>
  </Student>
  <Student StudentID="217457527">
    <Name>JamesLee</Name>
    <SIN>987654320</SIN>
    <PhoneNumber>2890090909</PhoneNumber>
    <Email>Jame@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>CanadaBank</Bank>
    <DegreeProgram>BA_ITEC</DegreeProgram>
    <FacID>FLAPS</FacID>
  </Student>
  <Student StudentID="217978542">
    <Name>Chris Forrest</Name>
    <SIN>978445615</SIN>
    <PhoneNumber>2890040808</PhoneNumber>
    <Email>forrestc@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>Scotia Bank</Bank>
    <DegreeProgram>BAH_ITEC</DegreeProgram>
    <FacID>FGS</FacID>
  </Student>
  <Student StudentID="218574681">
    <Name>Daniel Samms</Name>
    <SIN>982456873</SIN>
    <PhoneNumber>2892003959</PhoneNumber>
    <Email>Dsmmas@uni,ca</Email>
    <Contacts>Null</Contacts>
    <Bank>TD Bank</Bank>
    <DegreeProgram>BA_HO</DegreeProgram>
    <FacID>FAMPD</FacID>
  </Student>
  <Student StudentID="218574682">
    <Name>Person A</Name>
    <SIN>1111111111</SIN>
    <PhoneNumber>2890000001</PhoneNumber>
    <Email>PersonC@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>TD Bank</Bank>
    <DegreeProgram>BAH_HO</DegreeProgram>
    <FacID>FHo</FacID>
  </Student>
  <Student StudentID="218574683">
    <Name>Person B</Name>
    <SIN>1111111112</SIN>
    <PhoneNumber>2890000002</PhoneNumber>
    <Email>PersonB@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>TD Bank</Bank>
    <DegreeProgram>BA_HO</DegreeProgram>
    <FacID>FHo</FacID>
  </Student>
  <Student StudentID="218574684">
    <Name>Person C</Name>
    <SIN>1111111113</SIN>
    <PhoneNumber>2890000003</PhoneNumber>
    <Email>PersonC@uni.ca</Email>
    <Contacts>Null</Contacts>
    <Bank>TD Bank</Bank>
    <DegreeProgram>BA_ITEC</DegreeProgram>
    <FacID>FLAPS</FacID>
  </Student>
</StudentList>
');
commit;
end;
/

--Listof Professors

SELECT XMLROOT
(XMLELEMENT("ProfessorList", 
XMLAGG(XMLELEMENT("Professor", XMLATTRIBUTES(p.ProfID as "ProfessorID") 
,XMLAGG(XMLFOREST(p.name as "Name", p.SIN as "SIN", p.PNumber as "PhoneNumber", p.doid.DepartmentID as "DepID", p.PrefEmail as "Email", p.EContacts as "Contacts", p.Banking as "Bank"))
))), version '1.0') as RESULT from Professor p GROUP BY p.ProfID;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Professors.xml','
<ProfessorList>
  <Professor ProfessorID="33221100">
    <Name>Harry Potter</Name>
    <SIN>4444555566</SIN>
    <PhoneNumber>5052267537</PhoneNumber>
    <DepID>DDM</DepID>
    <Email>Harry@uni.ca</Email>
    <Contacts>None</Contacts>
    <Bank>Americas Bank</Bank>
  </Professor>
  <Professor ProfessorID="50719224">
    <Name>Joseph Anderson</Name>
    <SIN>3333444455</SIN>
    <PhoneNumber>4083516958</PhoneNumber>
    <DepID>DP</DepID>
    <Email>Joseph@uni.ca</Email>
    <Contacts>6516452139</Contacts>
    <Bank>Americas Bank</Bank>
  </Professor>
  <Professor ProfessorID="320809554">
    <Name>Michael Kremer</Name>
    <SIN>987654324</SIN>
    <PhoneNumber>289006060</PhoneNumber>
    <DepID>DCo</DepID>
    <Email>Michael@uni.ca</Email>
    <Contacts>588732941</Contacts>
    <Bank>Canada Bank</Bank>
  </Professor>
  <Professor ProfessorID="320910665">
    <Name>Steven King</Name>
    <SIN>1111222233</SIN>
    <PhoneNumber>9203307348</PhoneNumber>
    <DepID>DCo</DepID>
    <Email>Steven@uni.ca</Email>
    <Contacts>4083516958</Contacts>
    <Bank>Americas Bank</Bank>
  </Professor>
  <Professor ProfessorID="820146297">
    <Name>Tim Wells</Name>
    <SIN>2222333344</SIN>
    <PhoneNumber>9202411105</PhoneNumber>
    <DepID>DITEC</DepID>
    <Email>Tim@uni.ca</Email>
    <Contacts>9203307348</Contacts>
    <Bank>Americas Bank</Bank>
  </Professor>
</ProfessorList>
');
commit;
end;
/
--Listof Faculty & Departments

SELECT XMLROOT(XMLELEMENT("Faculties",
XMLAGG(XMLELEMENT("Faculties", XMLATTRIBUTES(d.foid.FacultyID as "FacultyID")
,XMLAGG(XMLELEMENT("Faculty", XMLATTRIBUTES(d.foid.FacultyName as "FacName")))
,XMLAGG(
XMLELEMENT("Departments", XMLATTRIBUTES(d.DepartmentID as "DepartmentID"),
XMLELEMENT("DepartmentName", XMLATTRIBUTES(d.DepartmentName as "DepName"))
))))), version '1.0') as RESULT from Department d GROUP BY d.foid.FacultyID;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Faculties.xml','
<Faculties>
  <Faculties FacultyID="FAMPD">
    <Faculty FacName="Arts, Media, Design"/>
    <Departments DepartmentID="DDM">
      <DepartmentName DepName="Digital Media"/>
    </Departments>
  </Faculties>
  <Faculties FacultyID="FHa">
    <Faculty FacName="Health"/>
    <Departments DepartmentID="DP">
      <DepartmentName DepName="Psychology"/>
    </Departments>
  </Faculties>
  <Faculties FacultyID="FHo">
    <Faculty FacName="Home"/>
    <Departments DepartmentID="DCo">
      <DepartmentName DepName="Cooking"/>
    </Departments>
  </Faculties>
  <Faculties FacultyID="FLAPS">
    <Faculty FacName="Liberal Arts"/>
    <Departments DepartmentID="DITEC">
      <DepartmentName DepName="ITEC"/>
    </Departments>
  </Faculties>
</Faculties>
');
commit;
end;
/




--Listof Degree Programs

SELECT XMLROOT(XMLELEMENT("DegreePrograms",
XMLAGG(XMLELEMENT("DegreeProgram",XMLATTRIBUTES(dp.DegreeID as "DPID")
, XMLAGG(XMLFOREST(dp.GPARequirement as "GPAReq", dp.CreditRequirement as "CredReq"))
))), version '1.0') as RESULT from DegreeProgram dp GROUP BY dp.DegreeID;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022DegreePrograms.xml','
<DegreePrograms>
  <DegreeProgram DPID="BAH_HO">
    <GPAReq>80</GPAReq>
    <CredReq>90</CredReq>
  </DegreeProgram>
  <DegreeProgram DPID="BAH_ITEC">
    <GPAReq>80</GPAReq>
    <CredReq>120</CredReq>
  </DegreeProgram>
  <DegreeProgram DPID="BA_HO">
    <GPAReq>60</GPAReq>
    <CredReq>60</CredReq>
  </DegreeProgram>
  <DegreeProgram DPID="BA_ITEC">
    <GPAReq>60</GPAReq>
    <CredReq>90</CredReq>
  </DegreeProgram>
</DegreePrograms>
');
commit;
end;
/

--Listof Degree Requirements

SELECT XMLROOT(XMLELEMENT("DegreeRequirements",
XMLAGG(XMLELEMENT("DegreeProgram",XMLATTRIBUTES(dr.dpoid.DegreeID as "DPID")
, XMLAGG(XMLELEMENT("CID", dr.coid.CourseID))
))), version '1.0') as RESULT from DegreeRequisite dr GROUP BY dr.dpoid.DegreeID;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022DegreeRequisites.xml','
<DegreeRequirements>
  <DegreeProgram DPID="BAH_HO">
    <CID>COOK1000</CID>
    <CID>COOK2000</CID>
  </DegreeProgram>
  <DegreeProgram DPID="BAH_ITEC">
    <CID>ITEC1010</CID>
    <CID>ITEC3505</CID>
    <CID>ITEC3010</CID>
    <CID>ITEC2620</CID>
  </DegreeProgram>
  <DegreeProgram DPID="BA_HO">
    <CID>COOK1000</CID>
    <CID>COOK2000</CID>
  </DegreeProgram>
  <DegreeProgram DPID="BA_ITEC">
    <CID>ITEC1010</CID>
    <CID>ITEC3505</CID>
    <CID>ITEC3010</CID>
    <CID>ITEC2620</CID>
  </DegreeProgram>
</DegreeRequirements>
');
commit;
end;
/

--Listof Courses

SELECT XMLROOT(XMLELEMENT("Courses",
XMLAGG(XMLELEMENT("CourseID", XMLATTRIBUTES(c.CourseID as "CourseID")
,XMLAGG(XMLFOREST(c.foid.FacultyID as "FacultyID", c.doid.DepartmentID as "DepartmentID", c.Cost as "Cost", c.CampusLocation as "CampusLocation", c.Credits as "Credits"))))), version '1.0') as RESULT from Course c GROUP BY c.CourseID;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Courses.xml','
<Courses>
  <CourseID CourseID="COOK1000">
    <FacultyID>FHo</FacultyID>
    <DepartmentID>DCo</DepartmentID>
    <Cost>1000</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
  <CourseID CourseID="COOK2000">
    <FacultyID>FHo</FacultyID>
    <DepartmentID>DCo</DepartmentID>
    <Cost>1010</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
  <CourseID CourseID="ITEC1010">
    <FacultyID>FLAPS</FacultyID>
    <DepartmentID>DITEC</DepartmentID>
    <Cost>950</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
  <CourseID CourseID="ITEC2620">
    <FacultyID>FLAPS</FacultyID>
    <DepartmentID>DITEC</DepartmentID>
    <Cost>975</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
  <CourseID CourseID="ITEC3010">
    <FacultyID>FLAPS</FacultyID>
    <DepartmentID>DITEC</DepartmentID>
    <Cost>960</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
  <CourseID CourseID="ITEC3505">
    <FacultyID>FLAPS</FacultyID>
    <DepartmentID>DITEC</DepartmentID>
    <Cost>980</Cost>
    <CampusLocation>Keele</CampusLocation>
    <Credits>3</Credits>
  </CourseID>
</Courses>
');
commit;
end;
/

--Listof Sections

SELECT XMLROOT(XMLELEMENT("SectionList",
XMLAGG(XMLELEMENT("Section", XMLATTRIBUTES(s.SectionID as "SectionID"),
XMLAGG(XMLFOREST(s.coid.CourseID as "CourseID",s.StartDate as "StartDate", s.EndDate as "EndDate", s.MaxCapacity as "MaxCapacity", s.CurrentCapacity as "CurrentCapacity", s.Time as "Time", s.RoomID as "RoomID", 
s.proid.ProfID as "ProfID", s.ctype.scoursetype() as "CourseType"))))), version '1.0') as RESULT from Section s GROUP BY s.SectionID; 

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Sections.xml','
<SectionList>
  <Section SectionID="COOK1000A">
    <CourseID>COOK1000</CourseID>
    <StartDate>Sept9</StartDate>
    <EndDate>Dec3</EndDate>
    <MaxCapacity>50</MaxCapacity>
    <CurrentCapacity>21</CurrentCapacity>
    <Time>W1500</Time>
    <RoomID>ACW009</RoomID>
    <ProfID>320809554</ProfID>
    <CourseType>LAB</CourseType>
  </Section>
  <Section SectionID="COOK1000B">
    <CourseID>COOK1000</CourseID>
    <StartDate>Sept9</StartDate>
    <EndDate>Dec3</EndDate>
    <MaxCapacity>50</MaxCapacity>
    <CurrentCapacity>45</CurrentCapacity>
    <Time>W1700</Time>
    <RoomID>ACE017</RoomID>
    <ProfID>320910665</ProfID>
    <CourseType>LAB</CourseType>
  </Section>
  <Section SectionID="COOK2000A">
    <CourseID>COOK2000</CourseID>
    <StartDate>Sept9</StartDate>
    <EndDate>Dec3</EndDate>
    <MaxCapacity>40</MaxCapacity>
    <CurrentCapacity>9</CurrentCapacity>
    <Time>W1700</Time>
    <RoomID>ACE017</RoomID>
    <ProfID>320809554</ProfID>
    <CourseType>LAB</CourseType>
  </Section>
  <Section SectionID="COOK2000B">
    <CourseID>COOK2000</CourseID>
    <StartDate>Sept9</StartDate>
    <EndDate>Dec3</EndDate>
    <MaxCapacity>40</MaxCapacity>
    <CurrentCapacity>21</CurrentCapacity>
    <Time>W1700</Time>
    <RoomID>ACE017</RoomID>
    <ProfID>320910665</ProfID>
    <CourseType>LAB</CourseType>
  </Section>
  <Section SectionID="ITEC1010M">
    <CourseID>ITEC1010</CourseID>
    <StartDate>Sept 9</StartDate>
    <EndDate>Dec3</EndDate>
    <MaxCapacity>300</MaxCapacity>
    <CurrentCapacity>259</CurrentCapacity>
    <Time>T1300</Time>
    <RoomID>VH5</RoomID>
    <ProfID>820146297</ProfID>
    <CourseType>LEC</CourseType>
  </Section>
  <Section SectionID="ITEC2620A">
    <CourseID>ITEC2620</CourseID>
    <StartDate>Sept 12</StartDate>
    <EndDate>Dec5</EndDate>
    <MaxCapacity>50</MaxCapacity>
    <CurrentCapacity>46</CurrentCapacity>
    <Time>T800</Time>
    <RoomID>DB007</RoomID>
    <ProfID>33221100</ProfID>
    <CourseType>BLEN</CourseType>
  </Section>
  <Section SectionID="ITEC3010B">
    <CourseID>ITEC3010</CourseID>
    <StartDate>Jan 6</StartDate>
    <EndDate>Apr3</EndDate>
    <MaxCapacity>200</MaxCapacity>
    <CurrentCapacity>157</CurrentCapacity>
    <Time>T1700</Time>
    <RoomID>ACE002</RoomID>
    <ProfID>33221100</ProfID>
    <CourseType>LEC</CourseType>
  </Section>
  <Section SectionID="ITEC3505N">
    <CourseID>ITEC3505</CourseID>
    <StartDate>Jan11</StartDate>
    <EndDate>Apr6</EndDate>
    <MaxCapacity>70</MaxCapacity>
    <CurrentCapacity>66</CurrentCapacity>
    <Time>T1100</Time>
    <RoomID>ACW205</RoomID>
    <ProfID>820146297</ProfID>
    <CourseType>BLEN</CourseType>
  </Section>
</SectionList>
');
commit;
end;
/
--Listof Student Grades

SELECT XMLROOT(XMLELEMENT("StudentList", XMLAGG(xmlelement("Student",xmlattributes(st.soid.sid as "SID"),xmlelement("SectionID", st.secoid.sectionid),xmlelement("Grade",st.grade)))), version '1.0') as RESULT from STranscript st;

declare
ret boolean;
begin
ret:=dbms_xdb.createresource('/public/grp1_folder/2022Transcript.xml','
<StudentList>
  <Student SID="217457527">
    <SectionID>ITEC1010M</SectionID>
    <Grade>90</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>ITEC2620A</SectionID>
    <Grade>85</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>ITEC3010B</SectionID>
    <Grade>68</Grade>
  </Student>
  <Student SID="218574681">
    <SectionID>ITEC3505N</SectionID>
    <Grade>74</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>ITEC3505N</SectionID>
    <Grade>96</Grade>
  </Student>
  <Student SID="218574682">
    <SectionID>COOK1000A</SectionID>
    <Grade>87</Grade>
  </Student>
  <Student SID="218574683">
    <SectionID>COOK2000A</SectionID>
    <Grade>83</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>ITEC1010M</SectionID>
    <Grade>69</Grade>
  </Student>
  <Student SID="218574681">
    <SectionID>ITEC1010M</SectionID>
    <Grade>76</Grade>
  </Student>
  <Student SID="218574683">
    <SectionID>ITEC1010M</SectionID>
    <Grade>89</Grade>
  </Student>
  <Student SID="217457527">
    <SectionID>COOK1000A</SectionID>
    <Grade>73</Grade>
  </Student>
  <Student SID="218574681">
    <SectionID>COOK2000A</SectionID>
    <Grade>79</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>COOK1000B</SectionID>
    <Grade>52</Grade>
  </Student>
  <Student SID="218574684">
    <SectionID>COOK2000B</SectionID>
    <Grade>12</Grade>
  </Student>
</StudentList>
');
commit;
end;
/
