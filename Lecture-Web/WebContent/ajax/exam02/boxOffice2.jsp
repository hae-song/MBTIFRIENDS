<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#searchResult{
width:70%;
height:600px;
border:1px solid red;
}
</style>


<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#searchBtn').click(function(){

		
		$.ajax({
			
			
			url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json',
			type: 'get',
			data: {
				key : '6386f0dcc8b4e7cdea1e3dfca9815a01',
				movieCd : '20210028',
				
			},
			success: callback, 
			 error: function() {
				alert('실패')
			}
		
	})
})
})

function callback(result){
	
	let list = result.movieInfoResult.movieInfoList
	
	//let list = result.boxOfficeResult.dailyBoxOfficeList
	
	for(let datail of list){
		console.log(result)
		
		
		// 감독
		let directors = detail.directors
		
		/*
        상세보기 클릭
        감독 : 
        장르 :
        배우정보
        배우명(작품 배역명)
        배우명(작품 배역명)
     
     */
		
		$('#searchResult').append('감독 : <h4>'+directors+"</h4>")
		
		
		$('#searchResult').append("<hr>")
		
		/*
        상세보기 클릭
        감독 : 
        장르 :
        배우정보
        배우명(작품 배역명)
        배우명(작품 배역명)
     
     */
		
	}
}
</script>
</head>
<body>
<h2>상세정보보기</h2>

<button id ="searchBtn">상세보기</button>
<h3>검색결과</h3>
<div id="searchResult"></div>
</body>
</html>