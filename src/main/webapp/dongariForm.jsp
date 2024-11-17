<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function sendDelete() {
    const baseUrl = window.location.origin;  // 현재 호스트 및 포트를 동적으로 가져옴
    const url = `${baseUrl}/web_programming/edit?id=178`;  // 동적 URL 생성
    
    fetch(url, {
        method: 'DELETE'
    })
    .then(response => {
        if (response.ok) {
            alert("삭제 성공");
            // 필요 시 다른 작업을 수행할 수 있습니다.
        } else {
            alert("삭제 실패");
        }
    })
    .catch(error => {
        console.error("오류 발생:", error);
        alert("요청 중 오류가 발생했습니다.");
    });
}
</script>
</head>
<body>
	<form action="${type}" method="post">
	<table border="0.5">
	<tr><th>title</th><th>summary</th><th>body</th><th>모집 상태</th>
	<th>지원시작일</th><th>지원종료일</th><th>지원주소</th><th>멤버수</th><th>sns</th>
	<th>위치</th></tr>
		<tr>
			<td><input type="text" value="${dongari.title}" name="title"></td>
			<td><input type="text" value="${dongari.summary}" name="summary"></td>
			<td>
				<input type="text" value="${dongari.body}" name="body"></td><td>
				<input type='radio' name='apply_status' value='1' checked/>모집 중
  				<input type='radio' name='apply_status' value='2' />상시 모집
  				<input type='radio' name='apply_status' value='3' />모집 완료
			</td>
			<td><input type="date" value="${dongari.apply_start}" name="apply_start"></td>
			<td><input type="date" value="${dongari.apply_end}" name="apply_end"></td>
			<td><input type="text" value="${dongari.apply_link}" name="apply_link"></td>
			<td><input type="text" value="${dongari.member_num}" name="member_num"></td>
			<td><input type="text" value="${dongari.sns_link}" name="sns_link"></td>
			<td><input type="text" value="${dongari.location}" name="location"></td>
		<tr>
	</table>
	<input type="hidden" value="${dongari.category_id}" name="category_id">
	<input type="hidden" value="${dongari.id}" name="id">
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	</form>
	<button onclick="sendDelete()">삭제</button>
</body>
</html>