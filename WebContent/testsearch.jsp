<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="css/skechybootstrap.min.css" rel='stylesheet'
	type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전적검색 결과</title>
</head>
<body>
	<div class="btn-group" data-toggle="buttons">
		<label class="btn btn-primary active"> <input type="radio"
			name="options" id="option1" checked=""> Radio 1
		</label> <label class="btn btn-primary"> <input type="radio"
			name="options" id="option2"> Radio 2
		</label> <label class="btn btn-primary"> <input type="radio"
			name="options" id="option3"> Radio 3
		</label>
	</div>
	
<div class="btn-group-vertical" data-toggle="buttons">
  <button type="button" class="btn btn-primary">Button</button>
  <button type="button" class="btn btn-primary">Button</button>
  <button type="button" class="btn btn-primary">Button</button>
  <button type="button" class="btn btn-primary">Button</button>
  <button type="button" class="btn btn-primary">Button</button>
  <button type="button" class="btn btn-primary">Button</button>
</div>

	<table class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<c:forEach begin="0" end="2">
					<th colspan="3">Solo 승 패 승률</th>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr class="table-active">
				<c:forEach begin="0" end="2">
					<td>asd<br>K/D
					</td>
					<td>asd<br>평균딜량
					</td>
					<td>asd<br>헤드샷 비율
					</td>
				</c:forEach>
			</tr>
			<tr class="table-active">
				<c:forEach begin="0" end="2">
					<td>asd<br>생존시간
					</td>
					<td>asd<br>최다킬
					</td>
					<td>asd<br>TOP10 rate
					</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<div class="btn-toolbar" role="toolbar"
		aria-label="Toolbar with button groups">
		<div class="btn-group mr-2" role="group" aria-label="First group">
			<button type="button" class="btn btn-secondary">1</button>
			<button type="button" class="btn btn-secondary">2</button>
			<button type="button" class="btn btn-secondary">3</button>
			<button type="button" class="btn btn-secondary">4</button>
		</div>
		<div class="btn-group mr-2" role="group" aria-label="Second group">
			<button type="button" class="btn btn-secondary">5</button>
			<button type="button" class="btn btn-secondary">6</button>
			<button type="button" class="btn btn-secondary">7</button>
		</div>
		<div class="btn-group" role="group" aria-label="Third group">
			<button type="button" class="btn btn-secondary">8</button>
		</div>
	</div>
	<div class="btn-group" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-secondary">Left</button>
		<button type="button" class="btn btn-secondary">Middle</button>
		<button type="button" class="btn btn-secondary">Right</button>
	</div>
</body>
</html>