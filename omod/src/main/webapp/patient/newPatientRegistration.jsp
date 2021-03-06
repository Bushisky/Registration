 <%--
 *  Copyright 2014 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Registration module.
 *
 *  Registration module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Registration module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Registration module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<openmrs:require privilege="Add Patients" otherwise="/login.htm" redirect="/findPatient.htm" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>
<br/>

<script type="text/javascript">

	// Hospital name
	hospitalName = "${hospitalName}";

	// Districts
	var _districts = new Array();
	<c:forEach var="district" items="${districts}" varStatus="status">
		_districts[${status.index}] = "${district}";
	</c:forEach>
	
	// Upazilas
	//Ghanshyam - Sagar :  date- 15 Dec, 2012. Redmine issue's for Bangladesh : #510 and #511 and #512
	var _upazilas = new Array();
	<c:forEach var="upazila" items="${upazilas}" varStatus="status">
		_upazilas[${status.index}] = "${upazila}";
	</c:forEach>
	
	var _payingCategoryMap = new Array();
	<c:forEach var="entry" items="${payingCategoryMap}">
		_payingCategoryMap[${entry.key}] = "${entry.value}";
	</c:forEach>
	
	var _nonPayingCategoryMap = new Array();
	<c:forEach var="entry" items="${nonPayingCategoryMap}">
		_nonPayingCategoryMap[${entry.key}] = "${entry.value}";
	</c:forEach>
	
	var _specialSchemeMap = new Array();
	<c:forEach var="entry" items="${specialSchemeMap}">
		_specialSchemeMap[${entry.key}] = "${entry.value}";
	</c:forEach>
	
	/**
	 ** MODEL FROM CONTROLLER
	 **/
	MODEL = {
		patientIdentifier: "${patientIdentifier}",
		districts: _districts,
		upazilas: _upazilas,
		////ghanshyam,16-dec-2013,3438 Remove the interdependency
		TRIAGE: "${TRIAGE}",
		OPDs: "${OPDs}",
		SPECIALCLINIC: "${SPECIALCLINIC}",
		payingCategory: "${payingCategory}",
		nonPayingCategory: "${nonPayingCategory}",
		specialScheme: "${specialScheme}",
		payingCategoryMap: _payingCategoryMap,
		nonPayingCategoryMap: _nonPayingCategoryMap,
		specialSchemeMap: _specialSchemeMap,
		universities: "${universities}",
		referredFrom: "${referralHospitals}",
		referralType: "${referralReasons}",
		TEMPORARYCAT: "${TEMPORARYCAT}",
		religions: "${religionList}"
	}
</script>
<jsp:include page="../includes/${hospitalName}/newPatientRegistrationtForm.jsp"/>
<!--  
<%@ include file="/WEB-INF/template/footer.jsp" %>  
-->