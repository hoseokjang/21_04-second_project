<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:import url="../top.jsp"/>
<script>
	function diag_value(category)
	{
		var category = category;
		var list = new Array(41,36,16,13,9);
		le = list[category-1];
		for(i=0;i < le;i++)
		{
			if(!document.getElementsByClassName("checkbox")[i].checked)
			{
				document.getElementsByClassName("checkbox")[i].value = 0;
			}
		}
	}
	function diag_value2(category)
	{
		var category = category;
		var list = new Array(41,36,16,13,9);
		le = list[category-1];
		for(i=0;i < le;i++)
		{
			if(document.getElementsByClassName("checkbox")[i].checked)
			{
				document.getElementsByClassName("checkbox_hidden")[i].disabled = true;
			}
		}
	}
</script>

 <style>
#self_diag_select {
	font-family: 'Noto Sans KR', sans-serif;
	}
#self_diag_select ul {
	list-style-type:none;
	padding-inline-start:0px;
}
#self_diag_select_top {
	width:1140px;margin:auto;
}
#select_options{
	border:1px solid #57c006; width:650px; margin:auto;
}
#select_options input{
	padding-left:10px;
}
</style>
<div id="self_diag_select">
	<div id="self_diag_select_top">
		<span style="display:inline-block"> <h4>자가진단</h4> </span>
		<span style="color:#CCCCCC">Self Diagnose</span>
		<br><br>
		<div style="display:inline-block;"> <h4><b style="color:#57c006">Step2</b></h4></div>
		<div style="display:inline-block">가지고 계신 증상을 모두 선택해주세요</span>
	</div>
	<br><br>
	<c:if test="${category==1}">
		<div> <h4>간/장/위/신장</h4> </div>
	</c:if>
	<c:if test="${category==2}">
		<div> <h4>혈행/혈압/혈당/심장병</h4> </div>
	</c:if>
	<c:if test="${category==3}">
		<div> <h4>뇌/정신건강</h4> </div>
	</c:if>
	<c:if test="${category==4}">
		<div> <h4>뼈</h4> </div>
	</c:if>
	<c:if test="${category==5}">
		<div> <h4>피부</h4> </div>
	</c:if>
	<br>
	<form method="post" action="diag_insert_ok">
	<input type="hidden" name="userid" value="${userid }">
	<div id="select_options" align="center">
		<c:if test="${category==1}">
			<div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="itching"> 가려움증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="itching">
			<input type="checkbox" class="checkbox" value="1" name="joint_pain"> 관절통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="joint_pain">
			<input type="checkbox" class="checkbox" value="1" name="stomach_pain"> 복통 &nbsp;&nbsp;  
			<input type="hidden" class="checkbox_hidden" value="0" name="stomach_pain">
			<input type="checkbox" class="checkbox" value="1" name="acidity"> 산도 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="acidity">
			<input type="checkbox" class="checkbox" value="1" name="ulcers_on_tongue"> 설염 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="ulcers_on_tongue">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="vomiting"> 구토 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="vomiting">
			<input type="checkbox" class="checkbox" value="1" name="burning_micturition"> 고통스러운 배뇨 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="burning_micturition">
			<input type="checkbox" class="checkbox" value="1" name="fatigue"> 피로감 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="fatigue">
			<input type="checkbox" class="checkbox" value="1" name="lethargy"> 무기력함  &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="lethargy">
			<input type="checkbox" class="checkbox" value="1" name="cough"> 기침   &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="cough">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="high_fever"> 고열 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="high_fever">
			<input type="checkbox" class="checkbox" value="1" name="sunken_eyes"> 푹 꺼진 눈 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="sunken_eyes">
			<input type="checkbox" class="checkbox" value="1" name="dehydration"> 탈수 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="dehydration">
			<input type="checkbox" class="checkbox" value="1" name="indigestion"> 소화불량 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="indigestion">
			<input type="checkbox" class="checkbox" value="1" name="yellowish_skin"> 누리끼리한 피부 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="yellowish_skin">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="dark_urine"> 검은 소변 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="dark_urine">
			<input type="checkbox" class="checkbox" value="1" name="nausea"> 메스꺼움 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="nausea">
			<input type="checkbox" class="checkbox" value="1" name="loss_of_appetite"> 식욕부진 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="loss_of_appetite">
			<input type="checkbox" class="checkbox" value="1" name="abdominal_pain"> 복통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="abdominal_pain">
			<input type="checkbox" class="checkbox" value="1" name="diarrhoea"> 설사 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="diarrhoea">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="mild_fever"> 미열 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="mild_fever">
			<input type="checkbox" class="checkbox" value="1" name="yellow_urine"> 누런 오줌 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="yellow_urine">
			<input type="checkbox" class="checkbox" value="1" name="yellowing_of_eyes"> 눈의 황달 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="yellowing_of_eyes">
			<input type="checkbox" class="checkbox" value="1" name="acute_liver_failure"> 급성 간 부전증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="acute_liver_failure">
			<input type="checkbox" class="checkbox" value="1" name="swelling_of_stomach"> 위 팽창 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="swelling_of_stomach">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="malaise"> 권태감 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="malaise">
			<input type="checkbox" class="checkbox" value="1" name="chest_pain"> 흉통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="chest_pain">
			<input type="checkbox" class="checkbox" value="1" name="bladder_discomfort"> 방광 불편 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="bladder_discomfort">
			<input type="checkbox" class="checkbox" value="1" name="foul_smell_of_urine"> 소변 냄새 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="foul_smell_of_urine">
			<input type="checkbox" class="checkbox" value="1" name="continuous_feel_of_urine"> 잔뇨감 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="continuous_feel_of_urine">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="passage_of_gases"> 가스 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="passage_of_gases">
			<input type="checkbox" class="checkbox" value="1" name="internal_itching"> 내부 가려움증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="internal_itching">
			<input type="checkbox" class="checkbox" value="1" name="muscle_pain"> 근육통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="muscle_pain">
			<input type="checkbox" class="checkbox" value="1" name="family_history"> 가족력 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="family_history">
			<input type="checkbox" class="checkbox" value="1" name="receiving_blood_transfusion"> 수혈 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="receiving_blood_transfusion">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="receiving_unsterile_injections"> 접종 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="receiving_unsterile_injections">
			<input type="checkbox" class="checkbox" value="1" name="coma"> 혼수상태 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="coma">
			<input type="checkbox" class="checkbox" value="1" name="stomach_bleeding"> 위 출혈 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="stomach_bleeding">
			<input type="checkbox" class="checkbox" value="1" name="distention_of_abdomen"> 복부팽창 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="distention_of_abdomen">
			<input type="checkbox" class="checkbox" value="1" name="history_of_alcohol_consumption"> 알코올 의존증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="history_of_alcohol_consumption">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="fluid_overload"> 체액 과잉 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="fluid_overload">
			</div>
			</div>
			<input type="hidden" name="skin_rash" value="0">
			<input type="hidden" name="continuous_sneezing" value="0">
			<input type="hidden" name="chills" value="0">
			<input type="hidden" name="anxiety" value="0">
			<input type="hidden" name="weight_loss" value="0">
			<input type="hidden" name="restlessness" value="0">
			<input type="hidden" name="irregular_sugar_level" value="0">
			<input type="hidden" name="breathlessness" value="0">
			<input type="hidden" name="sweating" value="0">
			<input type="hidden" name="headache" value="0">
			<input type="hidden" name="back_pain" value="0">
			<input type="hidden" name="constipation" value="0">
			<input type="hidden" name="swelled_lymph_nodes" value="0">
			<input type="hidden" name="blurred_and_distorted_vision" value="0">
			<input type="hidden" name="phlegm" value="0">
			<input type="hidden" name="throat_irritation" value="0">
			<input type="hidden" name="redness_of_eyes" value="0">
			<input type="hidden" name="sinus_pressure" value="0">
			<input type="hidden" name="runny_nose" value="0">
			<input type="hidden" name="congestion" value="0">
			<input type="hidden" name="weakness_in_limbs" value="0">
			<input type="hidden" name="pain_during_bowel_movements" value="0">
			<input type="hidden" name="pain_in_anal_region" value="0">
			<input type="hidden" name="bloody_stool" value="0">
			<input type="hidden" name="irritation_in_anus" value="0">
			<input type="hidden" name="neck_pain" value="0">
			<input type="hidden" name="dizziness" value="0">
			<input type="hidden" name="cramps" value="0">
			<input type="hidden" name="bruising" value="0">
			<input type="hidden" name="obesity" value="0">
			<input type="hidden" name="swollen_legs" value="0">
			<input type="hidden" name="swollen_blood_vessels" value="0">
			<input type="hidden" name="excessive_hunger" value="0">
			<input type="hidden" name="drying_and_tingling_lips" value="0">
			<input type="hidden" name="slurred_speech" value="0">
			<input type="hidden" name="knee_pain" value="0">
			<input type="hidden" name="hip_joint_pain" value="0">
			<input type="hidden" name="muscle_weakness" value="0">
			<input type="hidden" name="stiff_neck" value="0">
			<input type="hidden" name="swelling_joints" value="0">
			<input type="hidden" name="movement_stiffness" value="0">
			<input type="hidden" name="spinning_movements" value="0">
			<input type="hidden" name="loss_of_balance" value="0">
			<input type="hidden" name="unsteadiness" value="0">
			<input type="hidden" name="weakness_of_one_body_side" value="0">
			<input type="hidden" name="loss_of_smell" value="0">
			<input type="hidden" name="depression" value="0">
			<input type="hidden" name="irritability" value="0">
			<input type="hidden" name="altered_sensorium" value="0">
			<input type="hidden" name="increased_appetite" value="0">
			<input type="hidden" name="polyuria" value="0">
			<input type="hidden" name="lack_of_concentration" value="0">
			<input type="hidden" name="visual_disturbances" value="0">
			<input type="hidden" name="prominent_veins_on_calf" value="0">
			<input type="hidden" name="palpitations" value="0">
			<input type="hidden" name="painful_walking" value="0">
			<input type="hidden" name="pus_filled_pimples" value="0">
			<input type="hidden" name="blackheads" value="0">
			<input type="hidden" name="scurring" value="0">
			<input type="hidden" name="skin_peeling" value="0">
			<input type="hidden" name="silver_like_dusting" value="0">
			<input type="hidden" name="small_dents_in_nails" value="0">
			<input type="hidden" name="inflammatory_nails" value="0">
		</c:if>
		<c:if test="${category==2}">
		<div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="vomiting"> 구토 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="vomiting">
			<input type="checkbox" class="checkbox" value="1" name="fatigue"> 피로감 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="fatigue">
			<input type="checkbox" class="checkbox" value="1" name="anxiety"> 불안증세 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="anxiety">
			<input type="checkbox" class="checkbox" value="1" name="weight_loss"> 체중감소 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="weight_loss">
			<input type="checkbox" class="checkbox" value="1" name="restlessness"> 안절부절 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="restlessness">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="lethargy"> 무기력함 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="lethargy">
			<input type="checkbox" class="checkbox" value="1" name="irregular_sugar_level"> 불규칙한 당 수치 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="irregular_sugar_level">
			<input type="checkbox" class="checkbox" value="1" name="breathlessness"> 숨이 참 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="breathlessness">
			<input type="checkbox" class="checkbox" value="1" name="sweating"> 발한 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="sweating">
			<input type="checkbox" class="checkbox" value="1" name="headache"> 두통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="headache">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="nausea"> 메스꺼움 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="nausea">
			<input type="checkbox" class="checkbox" value="1" name="constipation"> 변비 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="constipation">
			<input type="checkbox" class="checkbox" value="1" name="blurred_and_distorted_vision"> 흐릿한 시야 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="blurred_and_distorted_vision">
			<input type="checkbox" class="checkbox" value="1" name="chest_pain"> 가슴통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="chest_pain">
			<input type="checkbox" class="checkbox" value="1" name="pain_during_bowel_movements"> 배변 중 통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="pain_during_bowel_movements">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="pain_in_anal_region"> 항문 부위의 통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="pain_in_anal_region">
			<input type="checkbox" class="checkbox" value="1" name="bloody_stool"> 혈변 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="bloody_stool">
			<input type="checkbox" class="checkbox" value="1" name="irritation_in_anus"> 항문 염증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="irritation_in_anus">
			<input type="checkbox" class="checkbox" value="1" name="dizziness"> 현기증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="dizziness">
			<input type="checkbox" class="checkbox" value="1" name="cramps"> 위 경련 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="cramps">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="obesity"> 멍듦 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="obesity">
			<input type="checkbox" class="checkbox" value="1" name="swollen_legs"> 다리가 부풀어오름 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="swollen_legs">
			<input type="checkbox" class="checkbox" value="1" name="swollen_blood_vessels"> 혈관 팽창 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="swollen_blood_vessels">
			<input type="checkbox" class="checkbox" value="1" name="excessive_hunger"> 과도한 배고픔 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="excessive_hunger">
			<input type="checkbox" class="checkbox" value="1" name="drying_and_tingling_lips"> 입술 건조 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="drying_and_tingling_lips">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="slurred_speech"> 어눌한 말투 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="slurred_speech">
			<input type="checkbox" class="checkbox" value="1" name="spinning_movements"> 스피닝 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="spinning_movements">
			<input type="checkbox" class="checkbox" value="1" name="loss_of_balance"> 균형감각 상실 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="loss_of_balance">
			<input type="checkbox" class="checkbox" value="1" name="unsteadiness"> 불안정 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="unsteadiness">
			<input type="checkbox" class="checkbox" value="1" name="irritability"> 과민 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="irritability">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="increased_appetite"> 식욕 증가 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="increased_appetite">
			<input type="checkbox" class="checkbox" value="1" name="polyuria"> 다뇨증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="polyuria">
			<input type="checkbox" class="checkbox" value="1" name="lack_of_concentration"> 집중력 부족 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="lack_of_concentration">
			<input type="checkbox" class="checkbox" value="1" name="fluid_overload"> 체액 과잉 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="fluid_overload">
			<input type="checkbox" class="checkbox" value="1" name="prominent_veins_on_calf"> 종아리 부종 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="prominent_veins_on_calf">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="palpitations"> 심장 두근거림 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="palpitations">
			</div>
		</div>	
			<input type="hidden" name="itching" value="0">
			<input type="hidden" name="skin_rash" value="0">
			<input type="hidden" name="continuous_sneezing" value="0">
			<input type="hidden" name="chills" value="0">
			<input type="hidden" name="joint_pain" value="0">
			<input type="hidden" name="stomach_pain" value="0">
			<input type="hidden" name="acidity" value="0">
			<input type="hidden" name="ulcers_on_tongue" value="0">
			<input type="hidden" name="burning_micturition" value="0">
			<input type="hidden" name="cough" value="0">
			<input type="hidden" name="high_fever" value="0">
			<input type="hidden" name="sunken_eyes" value="0">
			<input type="hidden" name="dehydration" value="0">
			<input type="hidden" name="indigestion" value="0">
			<input type="hidden" name="yellowish_skin" value="0">
			<input type="hidden" name="dark_urine" value="0">
			<input type="hidden" name="loss_of_appetite" value="0">
			<input type="hidden" name="back_pain" value="0">
			<input type="hidden" name="abdominal_pain" value="0">
			<input type="hidden" name="diarrhoea" value="0">
			<input type="hidden" name="mild_fever" value="0">
			<input type="hidden" name="yellow_urine" value="0">
			<input type="hidden" name="yellowing_of_eyes" value="0">
			<input type="hidden" name="acute_liver_failure" value="0">
			<input type="hidden" name="swelling_of_stomach" value="0">
			<input type="hidden" name="swelled_lymph_nodes" value="0">
			<input type="hidden" name="malaise" value="0">
			<input type="hidden" name="phlegm" value="0">
			<input type="hidden" name="throat_irritation" value="0">
			<input type="hidden" name="redness_of_eyes" value="0">
			<input type="hidden" name="sinus_pressure" value="0">
			<input type="hidden" name="runny_nose" value="0">
			<input type="hidden" name="congestion" value="0">
			<input type="hidden" name="weakness_in_limbs" value="0">
			<input type="hidden" name="neck_pain" value="0">
			<input type="hidden" name="bruising" value="0">
			<input type="hidden" name="knee_pain" value="0">
			<input type="hidden" name="hip_joint_pain" value="0">
			<input type="hidden" name="muscle_weakness" value="0">
			<input type="hidden" name="stiff_neck" value="0">
			<input type="hidden" name="swelling_joints" value="0">
			<input type="hidden" name="movement_stiffness" value="0">
			<input type="hidden" name="weakness_of_one_body_side" value="0">
			<input type="hidden" name="loss_of_smell" value="0">
			<input type="hidden" name="bladder_discomfort" value="0">
			<input type="hidden" name="foul_smell_of_urine" value="0">
			<input type="hidden" name="continuous_feel_of_urine" value="0">
			<input type="hidden" name="passage_of_gases" value="0">
			<input type="hidden" name="internal_itching" value="0">
			<input type="hidden" name="depression" value="0">
			<input type="hidden" name="muscle_pain" value="0">
			<input type="hidden" name="altered_sensorium" value="0">
			<input type="hidden" name="family_history" value="0">
			<input type="hidden" name="visual_disturbances" value="0">
			<input type="hidden" name="receiving_blood_transfusion" value="0">
			<input type="hidden" name="receiving_unsterile_injections" value="0">
			<input type="hidden" name="coma" value="0">
			<input type="hidden" name="stomach_bleeding" value="0">
			<input type="hidden" name="distention_of_abdomen" value="0">
			<input type="hidden" name="history_of_alcohol_consumption" value="0">
			<input type="hidden" name="painful_walking" value="0">
			<input type="hidden" name="pus_filled_pimples" value="0">
			<input type="hidden" name="blackheads" value="0">
			<input type="hidden" name="scurring" value="0">
			<input type="hidden" name="skin_peeling" value="0">
			<input type="hidden" name="silver_like_dusting" value="0">
			<input type="hidden" name="small_dents_in_nails" value="0">
			<input type="hidden" name="inflammatory_nails" value="0">
		</c:if>
		<c:if test="${category==3}">
			<div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="acidity"> 산도 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="acidity">
			<input type="checkbox" class="checkbox" value="1" name="vomiting"> 구토 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="vomiting">
			<input type="checkbox" class="checkbox" value="1" name="indigestion"> 소화불량 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="indigestion">
			<input type="checkbox" class="checkbox" value="1" name="headache"> 두통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="headache">
			<input type="checkbox" class="checkbox" value="1" name="nausea"> 메스꺼움 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="nausea">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="blurred_and_distorted_vision"> 흐릿한 시야 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="blurred_and_distorted_vision">
			<input type="checkbox" class="checkbox" value="1" name="excessive_hunger"> 과도한 배고픔 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="excessive_hunger">
			<input type="checkbox" class="checkbox" value="1" name="stiff_neck"> 뻣뻣한 목 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="stiff_neck">
			<input type="checkbox" class="checkbox" value="1" name="spinning_movements"> 스피닝 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="spinning_movements">
			<input type="checkbox" class="checkbox" value="1" name="loss_of_balance"> 균형감각 상실 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="loss_of_balance">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="unsteadiness"> 불안정 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="unsteadiness">
			<input type="checkbox" class="checkbox" value="1" name="weakness_of_one_body_side"> 몸 한 쪽에 힘이없음 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="weakness_of_one_body_side">
			<input type="checkbox" class="checkbox" value="1" name="depression"> 우울감 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="depression">
			<input type="checkbox" class="checkbox" value="1" name="irritability"> 과민 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="irritability">
			<input type="checkbox" class="checkbox" value="1" name="altered_sensorium"> 변형된 감각 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="altered_sensorium">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="visual_disturbances"> 시야 흐려짐 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="visual_disturbances">
			</div>
			</div>
			<input type="hidden" name="itching" value="0">
			<input type="hidden" name="skin_rash" value="0">
			<input type="hidden" name="continuous_sneezing" value="0">
			<input type="hidden" name="chills" value="0">
			<input type="hidden" name="joint_pain" value="0">
			<input type="hidden" name="stomach_pain" value="0">
			<input type="hidden" name="ulcers_on_tongue" value="0">
			<input type="hidden" name="burning_micturition" value="0">
			<input type="hidden" name="fatigue" value="0">
			<input type="hidden" name="anxiety" value="0">
			<input type="hidden" name="weight_loss" value="0">
			<input type="hidden" name="restlessness" value="0">
			<input type="hidden" name="lethargy" value="0">
			<input type="hidden" name="irregular_sugar_level" value="0">
			<input type="hidden" name="cough" value="0">
			<input type="hidden" name="high_fever" value="0">
			<input type="hidden" name="sunken_eyes" value="0">
			<input type="hidden" name="breathlessness" value="0">
			<input type="hidden" name="sweating" value="0">
			<input type="hidden" name="dehydration" value="0">
			<input type="hidden" name="yellowish_skin" value="0">
			<input type="hidden" name="dark_urine" value="0">
			<input type="hidden" name="loss_of_appetite" value="0">
			<input type="hidden" name="back_pain" value="0">
			<input type="hidden" name="constipation" value="0">
			<input type="hidden" name="abdominal_pain" value="0">
			<input type="hidden" name="diarrhoea" value="0">
			<input type="hidden" name="mild_fever" value="0">
			<input type="hidden" name="yellow_urine" value="0">
			<input type="hidden" name="yellowing_of_eyes" value="0">
			<input type="hidden" name="acute_liver_failure" value="0">
			<input type="hidden" name="swelling_of_stomach" value="0">
			<input type="hidden" name="swelled_lymph_nodes" value="0">
			<input type="hidden" name="malaise" value="0">
			<input type="hidden" name="phlegm" value="0">
			<input type="hidden" name="throat_irritation" value="0">
			<input type="hidden" name="redness_of_eyes" value="0">
			<input type="hidden" name="sinus_pressure" value="0">
			<input type="hidden" name="runny_nose" value="0">
			<input type="hidden" name="congestion" value="0">
			<input type="hidden" name="chest_pain" value="0">
			<input type="hidden" name="weakness_in_limbs" value="0">
			<input type="hidden" name="pain_during_bowel_movements" value="0">
			<input type="hidden" name="pain_in_anal_region" value="0">
			<input type="hidden" name="bloody_stool" value="0">
			<input type="hidden" name="irritation_in_anus" value="0">
			<input type="hidden" name="neck_pain" value="0">
			<input type="hidden" name="dizziness" value="0">
			<input type="hidden" name="cramps" value="0">
			<input type="hidden" name="bruising" value="0">
			<input type="hidden" name="obesity" value="0">
			<input type="hidden" name="swollen_legs" value="0">
			<input type="hidden" name="swollen_blood_vessels" value="0">
			<input type="hidden" name="drying_and_tingling_lips" value="0">
			<input type="hidden" name="slurred_speech" value="0">
			<input type="hidden" name="knee_pain" value="0">
			<input type="hidden" name="hip_joint_pain" value="0">
			<input type="hidden" name="muscle_weakness" value="0">
			<input type="hidden" name="swelling_joints" value="0">
			<input type="hidden" name="movement_stiffness" value="0">
			<input type="hidden" name="loss_of_smell" value="0">
			<input type="hidden" name="bladder_discomfort" value="0">
			<input type="hidden" name="foul_smell_of_urine" value="0">
			<input type="hidden" name="continuous_feel_of_urine" value="0">
			<input type="hidden" name="passage_of_gases" value="0">
			<input type="hidden" name="internal_itching" value="0">
			<input type="hidden" name="muscle_pain" value="0">
			<input type="hidden" name="increased_appetite" value="0">
			<input type="hidden" name="polyuria" value="0">
			<input type="hidden" name="family_history" value="0">
			<input type="hidden" name="lack_of_concentration" value="0">
			<input type="hidden" name="receiving_blood_transfusion" value="0">
			<input type="hidden" name="receiving_unsterile_injections" value="0">
			<input type="hidden" name="coma" value="0">
			<input type="hidden" name="stomach_bleeding" value="0">
			<input type="hidden" name="distention_of_abdomen" value="0">
			<input type="hidden" name="history_of_alcohol_consumption" value="0">
			<input type="hidden" name="fluid_overload" value="0">
			<input type="hidden" name="prominent_veins_on_calf" value="0">
			<input type="hidden" name="palpitations" value="0">
			<input type="hidden" name="painful_walking" value="0">
			<input type="hidden" name="pus_filled_pimples" value="0">
			<input type="hidden" name="blackheads" value="0">
			<input type="hidden" name="scurring" value="0">
			<input type="hidden" name="skin_peeling" value="0">
			<input type="hidden" name="silver_like_dusting" value="0">
			<input type="hidden" name="small_dents_in_nails" value="0">
			<input type="hidden" name="inflammatory_nails" value="0">
		</c:if>
		<c:if test="${category==4}">
		<div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="joint_pain"> 관절통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="joint_pain">
			<input type="checkbox" class="checkbox" value="1" name="back_pain"> 요통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="back_pain">
			<input type="checkbox" class="checkbox" value="1" name="weakness_in_limbs"> 손발 약해짐 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="weakness_in_limbs">
			<input type="checkbox" class="checkbox" value="1" name="neck_pain"> 목 통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="neck_pain">
			<input type="checkbox" class="checkbox" value="1" name="dizziness"> 현기증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="dizziness">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="knee_pain"> 무릎 통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="knee_pain">
			<input type="checkbox" class="checkbox" value="1" name="hip_joint_pain"> 고관절 통증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="hip_joint_pain">
			<input type="checkbox" class="checkbox" value="1" name="muscle_weakness"> 근력 약화 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="muscle_weakness">
			<input type="checkbox" class="checkbox" value="1" name="stiff_neck"> 뻣뻣한 목 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="stiff_neck">
			<input type="checkbox" class="checkbox" value="1" name="swelling_joints"> 부종 관절 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="swelling_joints">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="movement_stiffness"> 강한 운동 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="movement_stiffness">
			<input type="checkbox" class="checkbox" value="1" name="loss_of_balance"> 균형감각 상실 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="loss_of_balance">
			<input type="checkbox" class="checkbox" value="1" name="painful_walking"> 걷기 힘듦 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="painful_walking">
			</div>
		</div>
			<input type="hidden" name="itching" value="0">
			<input type="hidden" name="skin_rash" value="0">
			<input type="hidden" name="continuous_sneezing" value="0">
			<input type="hidden" name="chills" value="0">
			<input type="hidden" name="stomach_pain" value="0">
			<input type="hidden" name="acidity" value="0">
			<input type="hidden" name="ulcers_on_tongue" value="0">
			<input type="hidden" name="vomiting" value="0">
			<input type="hidden" name="burning_micturition" value="0">
			<input type="hidden" name="fatigue" value="0">
			<input type="hidden" name="anxiety" value="0">
			<input type="hidden" name="weight_loss" value="0">
			<input type="hidden" name="restlessness" value="0">
			<input type="hidden" name="lethargy" value="0">
			<input type="hidden" name="irregular_sugar_level" value="0">
			<input type="hidden" name="cough" value="0">
			<input type="hidden" name="high_fever" value="0">
			<input type="hidden" name="sunken_eyes" value="0">
			<input type="hidden" name="breathlessness" value="0">
			<input type="hidden" name="sweating" value="0">
			<input type="hidden" name="dehydration" value="0">
			<input type="hidden" name="indigestion" value="0">
			<input type="hidden" name="headache" value="0">
			<input type="hidden" name="yellowish_skin" value="0">
			<input type="hidden" name="dark_urine" value="0">
			<input type="hidden" name="nausea" value="0">
			<input type="hidden" name="loss_of_appetite" value="0">
			<input type="hidden" name="constipation" value="0">
			<input type="hidden" name="abdominal_pain" value="0">
			<input type="hidden" name="diarrhoea" value="0">
			<input type="hidden" name="mild_fever" value="0">
			<input type="hidden" name="yellow_urine" value="0">
			<input type="hidden" name="yellowing_of_eyes" value="0">
			<input type="hidden" name="acute_liver_failure" value="0">
			<input type="hidden" name="swelling_of_stomach" value="0">
			<input type="hidden" name="swelled_lymph_nodes" value="0">
			<input type="hidden" name="malaise" value="0">
			<input type="hidden" name="blurred_and_distorted_vision" value="0">
			<input type="hidden" name="phlegm" value="0">
			<input type="hidden" name="throat_irritation" value="0">
			<input type="hidden" name="redness_of_eyes" value="0">
			<input type="hidden" name="sinus_pressure" value="0">
			<input type="hidden" name="runny_nose" value="0">
			<input type="hidden" name="congestion" value="0">
			<input type="hidden" name="chest_pain" value="0">
			<input type="hidden" name="pain_during_bowel_movements" value="0">
			<input type="hidden" name="pain_in_anal_region" value="0">
			<input type="hidden" name="bloody_stool" value="0">
			<input type="hidden" name="irritation_in_anus" value="0">
			<input type="hidden" name="cramps" value="0">
			<input type="hidden" name="bruising" value="0">
			<input type="hidden" name="obesity" value="0">
			<input type="hidden" name="swollen_legs" value="0">
			<input type="hidden" name="swollen_blood_vessels" value="0">
			<input type="hidden" name="excessive_hunger" value="0">
			<input type="hidden" name="drying_and_tingling_lips" value="0">
			<input type="hidden" name="slurred_speech" value="0">
			<input type="hidden" name="spinning_movements" value="0">
			<input type="hidden" name="unsteadiness" value="0">
			<input type="hidden" name="weakness_of_one_body_side" value="0">
			<input type="hidden" name="loss_of_smell" value="0">
			<input type="hidden" name="bladder_discomfort" value="0">
			<input type="hidden" name="foul_smell_of_urine" value="0">
			<input type="hidden" name="continuous_feel_of_urine" value="0">
			<input type="hidden" name="passage_of_gases" value="0">
			<input type="hidden" name="internal_itching" value="0">
			<input type="hidden" name="depression" value="0">
			<input type="hidden" name="irritability" value="0">
			<input type="hidden" name="muscle_pain" value="0">
			<input type="hidden" name="altered_sensorium" value="0">
			<input type="hidden" name="increased_appetite" value="0">
			<input type="hidden" name="polyuria" value="0">
			<input type="hidden" name="family_history" value="0">
			<input type="hidden" name="lack_of_concentration" value="0">
			<input type="hidden" name="visual_disturbances" value="0">
			<input type="hidden" name="receiving_blood_transfusion" value="0">
			<input type="hidden" name="receiving_unsterile_injections" value="0">
			<input type="hidden" name="coma" value="0">
			<input type="hidden" name="stomach_bleeding" value="0">
			<input type="hidden" name="distention_of_abdomen" value="0">
			<input type="hidden" name="history_of_alcohol_consumption" value="0">
			<input type="hidden" name="fluid_overload" value="0">
			<input type="hidden" name="prominent_veins_on_calf" value="0">
			<input type="hidden" name="palpitations" value="0">
			<input type="hidden" name="pus_filled_pimples" value="0">
			<input type="hidden" name="blackheads" value="0">
			<input type="hidden" name="scurring" value="0">
			<input type="hidden" name="skin_peeling" value="0">
			<input type="hidden" name="silver_like_dusting" value="0">
			<input type="hidden" name="small_dents_in_nails" value="0">
			<input type="hidden" name="inflammatory_nails" value="0">
		</c:if>
		<c:if test="${category==5}">
		<div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="skin_rash"> 피부 발진 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="skin_rash">
			<input type="checkbox" class="checkbox" value="1" name="joint_pain"> 관절통 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="joint_pain">
			<input type="checkbox" class="checkbox" value="1" name="pus_filled_pimples"> 여드름 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="pus_filled_pimples">
			<input type="checkbox" class="checkbox" value="1" name="blackheads"> 블랙헤드 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="blackheads">
			<input type="checkbox" class="checkbox" value="1" name="scurring"> 괴롭힘 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="scurring">
			</div>
			<div>
			<input type="checkbox" class="checkbox" value="1" name="skin_peeling"> 피부 벗겨짐 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="skin_peeling">
			<input type="checkbox" class="checkbox" value="1" name="silver_like_dusting"> 은백색의 때 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="silver_like_dusting">
			<input type="checkbox" class="checkbox" value="1" name="small_dents_in_nails"> 손톱 파임 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="small_dents_in_nails">
			<input type="checkbox" class="checkbox" value="1" name="inflammatory_nails"> 손톱 염증 &nbsp;&nbsp;
			<input type="hidden" class="checkbox_hidden" value="0" name="inflammatory_nails">
			</div>
		</div>
			<input type="hidden" name="itching" value="0">
			<input type="hidden" name="continuous_sneezing" value="0">
			<input type="hidden" name="chills" value="0">
			<input type="hidden" name="stomach_pain" value="0">
			<input type="hidden" name="acidity" value="0">
			<input type="hidden" name="ulcers_on_tongue" value="0">
			<input type="hidden" name="vomiting" value="0">
			<input type="hidden" name="burning_micturition" value="0">
			<input type="hidden" name="fatigue" value="0">
			<input type="hidden" name="anxiety" value="0">
			<input type="hidden" name="weight_loss" value="0">
			<input type="hidden" name="restlessness" value="0">
			<input type="hidden" name="lethargy" value="0">
			<input type="hidden" name="irregular_sugar_level" value="0">
			<input type="hidden" name="cough" value="0">
			<input type="hidden" name="high_fever" value="0">
			<input type="hidden" name="sunken_eyes" value="0">
			<input type="hidden" name="breathlessness" value="0">
			<input type="hidden" name="sweating" value="0">
			<input type="hidden" name="dehydration" value="0">
			<input type="hidden" name="indigestion" value="0">
			<input type="hidden" name="headache" value="0">
			<input type="hidden" name="yellowish_skin" value="0">
			<input type="hidden" name="dark_urine" value="0">
			<input type="hidden" name="nausea" value="0">
			<input type="hidden" name="loss_of_appetite" value="0">
			<input type="hidden" name="back_pain" value="0">
			<input type="hidden" name="constipation" value="0">
			<input type="hidden" name="abdominal_pain" value="0">
			<input type="hidden" name="diarrhoea" value="0">
			<input type="hidden" name="mild_fever" value="0">
			<input type="hidden" name="yellow_urine" value="0">
			<input type="hidden" name="yellowing_of_eyes" value="0">
			<input type="hidden" name="acute_liver_failure" value="0">
			<input type="hidden" name="swelling_of_stomach" value="0">
			<input type="hidden" name="swelled_lymph_nodes" value="0">
			<input type="hidden" name="malaise" value="0">
			<input type="hidden" name="blurred_and_distorted_vision" value="0">
			<input type="hidden" name="phlegm" value="0">
			<input type="hidden" name="throat_irritation" value="0">
			<input type="hidden" name="redness_of_eyes" value="0">
			<input type="hidden" name="sinus_pressure" value="0">
			<input type="hidden" name="runny_nose" value="0">
			<input type="hidden" name="congestion" value="0">
			<input type="hidden" name="chest_pain" value="0">
			<input type="hidden" name="weakness_in_limbs" value="0">
			<input type="hidden" name="pain_during_bowel_movements" value="0">
			<input type="hidden" name="pain_in_anal_region" value="0">
			<input type="hidden" name="bloody_stool" value="0">
			<input type="hidden" name="irritation_in_anus" value="0">
			<input type="hidden" name="neck_pain" value="0">
			<input type="hidden" name="dizziness" value="0">
			<input type="hidden" name="cramps" value="0">
			<input type="hidden" name="bruising" value="0">
			<input type="hidden" name="obesity" value="0">
			<input type="hidden" name="swollen_legs" value="0">
			<input type="hidden" name="swollen_blood_vessels" value="0">
			<input type="hidden" name="excessive_hunger" value="0">
			<input type="hidden" name="drying_and_tingling_lips" value="0">
			<input type="hidden" name="slurred_speech" value="0">
			<input type="hidden" name="knee_pain" value="0">
			<input type="hidden" name="hip_joint_pain" value="0">
			<input type="hidden" name="muscle_weakness" value="0">
			<input type="hidden" name="stiff_neck" value="0">
			<input type="hidden" name="swelling_joints" value="0">
			<input type="hidden" name="movement_stiffness" value="0">
			<input type="hidden" name="spinning_movements" value="0">
			<input type="hidden" name="loss_of_balance" value="0">
			<input type="hidden" name="unsteadiness" value="0">
			<input type="hidden" name="weakness_of_one_body_side" value="0">
			<input type="hidden" name="loss_of_smell" value="0">
			<input type="hidden" name="bladder_discomfort" value="0">
			<input type="hidden" name="foul_smell_of_urine" value="0">
			<input type="hidden" name="continuous_feel_of_urine" value="0">
			<input type="hidden" name="passage_of_gases" value="0">
			<input type="hidden" name="internal_itching" value="0">
			<input type="hidden" name="depression" value="0">
			<input type="hidden" name="irritability" value="0">
			<input type="hidden" name="muscle_pain" value="0">
			<input type="hidden" name="altered_sensorium" value="0">
			<input type="hidden" name="increased_appetite" value="0">
			<input type="hidden" name="polyuria" value="0">
			<input type="hidden" name="family_history" value="0">
			<input type="hidden" name="lack_of_concentration" value="0">
			<input type="hidden" name="visual_disturbances" value="0">
			<input type="hidden" name="receiving_blood_transfusion" value="0">
			<input type="hidden" name="receiving_unsterile_injections" value="0">
			<input type="hidden" name="coma" value="0">
			<input type="hidden" name="stomach_bleeding" value="0">
			<input type="hidden" name="distention_of_abdomen" value="0">
			<input type="hidden" name="history_of_alcohol_consumption" value="0">
			<input type="hidden" name="fluid_overload" value="0">
			<input type="hidden" name="prominent_veins_on_calf" value="0">
			<input type="hidden" name="palpitations" value="0">
			<input type="hidden" name="painful_walking" value="0">
		</c:if>
	</div>
	<br><br><br>
	<div>
		<input type="submit" value="진단">
	</div>
	</form>
</div>
</div>
<br><br><br><br>

<c:import url="../bottom.jsp"/>